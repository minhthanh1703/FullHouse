using FullHouseWebsite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using System.Text;


namespace FullHouseWebsite.Controllers
{
    public class LoginController : Controller
    {
        FullHouseEntities db = new FullHouseEntities();

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        // GET: Login
        public ActionResult Login(FormCollection fc)
        {
            string email = fc["txtEmail"].ToString();
            string password = fc["txtPassword"].ToString();

            string passMD5 = "";
            byte[] buffer = Encoding.UTF8.GetBytes(password);
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            buffer = md5.ComputeHash(buffer);
            for (int i = 0; i < buffer.Length; i++)
            {
                passMD5 = passMD5 + buffer[i].ToString("x2");
            }

            tbl_Admin Admin = db.tbl_Admin.SingleOrDefault(n => n.emailAdmin == email && n.password == passMD5);
            if (Admin == null)
            {
                ViewBag.Noti = "Wrong email or password";
                return View();
            }
            else
            {
                Session["Admin"] = Admin;
                return View("EditAdmin");
            }          
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(FormCollection fc)
        {
            bool error = false;
            string email = fc["txtEmail"].ToString().Trim();
            string password = fc["txtPassword"].ToString().Trim();
            string fullname = fc["txtFullName"].ToString().Trim();
            string phone = fc["txtPhoneNumber"].ToString().Trim();
            string bank = fc["txtBankNumber"].ToString().Trim();

            if(db.tbl_Admin.SingleOrDefault(n=>n.emailAdmin == email) != null)
            {
                ViewBag.Noti = "Email đã tồn tại.";
                error = true;
            }

            string passMD5 = "";
            byte[] buffer = Encoding.UTF8.GetBytes(password);
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            buffer = md5.ComputeHash(buffer);
            for (int i = 0; i < buffer.Length; i++)
            {
                passMD5 = passMD5 + buffer[i].ToString("x2");
            }

            if (error == false)
            {
                tbl_Admin admin = new tbl_Admin
                {
                    emailAdmin = email,
                    password = passMD5,
                    fullname = fullname,
                    phoneNumber = phone,
                    bankNumber = bank
                };
                db.tbl_Admin.Add(admin);
                db.SaveChanges();
                return View("Login");
            }
            else
            {
                return View();
            }

            
        }

        [HttpGet]
        public ActionResult EditAdmin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult EditAdmin(FormCollection fc)
        {
            string email = fc["txtEmail"].ToString().Trim();
            string fullname = fc["txtFullName"].ToString().Trim();
            string phone = fc["txtPhoneNumber"].ToString().Trim();
            string bank = fc["txtBankNumber"].ToString().Trim();

            tbl_Admin admin = db.tbl_Admin.SingleOrDefault(n => n.emailAdmin == email);
            admin.fullname = fullname;
            admin.phoneNumber = phone;
            admin.bankNumber = bank;

            Session["Admin"] = admin;

            db.Entry(admin).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return View();

        }

        public ActionResult GetListHouseByAdmin()
        {
            tbl_Admin admin = (tbl_Admin)Session["Admin"];
            string email = admin.emailAdmin;
            List<tbl_House> listHouse = db.tbl_House.Where(n => n.emailAdmin == email).ToList();
            return View(listHouse);

        }
        //Logout
        public ActionResult Logout()
        {
            Session["Admin"] = null;
            return RedirectToAction("Index", "Home");
        }

        //
        public ActionResult GetRequestByUser()
        {
            tbl_Admin admin = (tbl_Admin)Session["Admin"];
            string email = admin.emailAdmin;
            List<tbl_Customer> listCustomer = db.tbl_Customer.Where(n => n.emailAdmin == email).OrderByDescending(n => n.date).ToList();
            
            List<GetRequestByUserModel> listResult = new List<GetRequestByUserModel>();
            foreach (var item in listCustomer)
            {
                GetRequestByUserModel model = new GetRequestByUserModel();
                model.customer = item;
                model.house = db.tbl_House.SingleOrDefault(n => n.houseID == item.houseID);
                listResult.Add(model);
            }
            
            
            return View(listResult);
        }



        public ActionResult GetInfomationCustomer(int customerID)
        {
            tbl_Customer customer = db.tbl_Customer.SingleOrDefault(n => n.customerID == customerID);
            customer.readStatus = true;
            db.Entry(customer).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return View(customer);
        }

    }
}
