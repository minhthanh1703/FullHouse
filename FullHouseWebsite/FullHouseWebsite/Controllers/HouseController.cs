using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using FullHouseWebsite.Models;
using Newtonsoft.Json;
using PagedList;
using PagedList.Mvc;

namespace FullHouseWebsite.Controllers
{

    public class HouseController : Controller
    {
        FullHouseEntities db = new FullHouseEntities();



        public ViewResult ViewDetailAndImage(int HouseID = 0)
        {
            tbl_House house = db.tbl_House.SingleOrDefault(n => n.houseID == HouseID);


            if (house == null)
            {
                Response.StatusCode = 404;
                return null;
            }


            House h = new House();
            h.house = house;
            h.listImage = db.tbl_Image.Where(n => n.houseID == house.houseID).ToList();


            h.areaName = db.tbl_Area.SingleOrDefault(n => n.areaID == house.areaID).areaName;

            int districtID = int.Parse(db.tbl_Area.SingleOrDefault(n => n.areaID == house.areaID).districtID.ToString());
            h.districtName = db.tbl_District.SingleOrDefault(n => n.districtID == districtID).districtName;

            string email = house.emailAdmin;
            tbl_Admin admin = db.tbl_Admin.SingleOrDefault(n => n.emailAdmin == email);

            ViewBag.InfoAdmin = admin.fullname + ", " + admin.phoneNumber;
            return View(h);

        }


        // xem hinh anh o trang chi tiet
        public PartialViewResult ImageDetailsPartial(int houseID)
        {
            List<tbl_Image> listImage = db.tbl_Image.Where(n => n.houseID == houseID).ToList();
            return PartialView(listImage);
        }



        // xem list cua quan
        public ViewResult ShowHouseAndImageByDistrict(int districtID, int? page)
        {
            List<tbl_Area> listArea = db.tbl_Area.Where(n => n.districtID == districtID).ToList();
            if (listArea == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            else
            {
                List<House> listHouse = new List<House>();

                foreach (var item in listArea)
                {
                    List<tbl_House> listHouseArea = db.tbl_House.Where(n => n.areaID == item.areaID && n.rentStatus == false).ToList();
                    foreach (var item1 in listHouseArea)
                    {
                        House h = new House();
                        h.house = item1;
                        h.listImage = db.tbl_Image.Where(n => n.houseID == item1.houseID).ToList();
                        h.districtID = districtID;



                        listHouse.Add(h);
                    }
                }

                string nameDistrict = db.tbl_District.SingleOrDefault(n => n.districtID == districtID).districtName;
                ViewBag.InforDistrict = nameDistrict;
                //Phan trang
                int pageSize = 9;
                int pageNumber = (page ?? 1);

                return View(listHouse.ToPagedList(pageNumber, pageSize));
            }


        }
        //lay tat ca cac quan show len dropdown
        public PartialViewResult GetAllDistrict()
        {
            List<tbl_District> listDistrict = db.tbl_District.ToList();
            ViewBag.DistrictList = new SelectList(listDistrict, "districtID", "districtName");
            return PartialView();
        }

        // su dung json de lay list cac phuong trong quan
        public JsonResult GetAreaList(int districtID)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<tbl_Area> areaList = db.tbl_Area.Where(n => n.districtID == districtID).ToList();
            return Json(areaList, JsonRequestBehavior.AllowGet);
        }

        public bool changeStatusHouse(int id)
        {
            tbl_House house = db.tbl_House.SingleOrDefault(n => n.houseID == id);
            if (house.rentStatus == true)
            {
                house.rentStatus = false;
                db.Entry(house).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            else
            {
                house.rentStatus = true;
                db.Entry(house).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return false;
            }


        }
        [HttpPost]
        public JsonResult changeButtonState(int id)
        {

            var result = changeStatusHouse(id);

            return Json(new
            {
                status = result
            });

        }
        [HttpPost]
        public ActionResult GetInfoUser(FormCollection fc)
        {
            string fullName = fc["txtName"].ToString();
            string phoneNumber = fc["txtNumerPhone"].ToString();
            string email = fc["txtEmail"].ToString();
            string message = fc["txtText"].ToString();
            int houseID = int.Parse(fc["txtHouseID"].ToString());

            tbl_House emailAdmin = db.tbl_House.SingleOrDefault(n => n.houseID == houseID);
            tbl_Customer customer = new tbl_Customer
            {
                fullname = fullName,
                phoneNumber = phoneNumber,
                emailCustomer = email,
                message = message,
                emailAdmin = emailAdmin.emailAdmin,
                readStatus = false,
                date = DateTime.Now,
                houseID = houseID
            };
            db.tbl_Customer.Add(customer);
            db.SaveChanges();
            ViewDetailAndImage(houseID);
            return RedirectToAction("ViewDetailAndImage", "House", new { HouseID = houseID });
        }


        [HttpPost]
        public ActionResult LoadHouseToUpdate(FormCollection fc)
        {
            int houseID = int.Parse(fc["txtHouseID"].ToString());
            House house = new House();
            tbl_House h = db.tbl_House.SingleOrDefault(n => n.houseID == houseID);
            house.house = h;
            house.listImage = db.tbl_Image.Where(n => n.houseID == houseID).ToList();
            Session["House"] = house;
            return View("UpdateHouse");
        }

        [HttpGet]
        public ActionResult UpdateHouse()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UpdateHouse(FormCollection fc)
        {
            string sHouseID = fc["txtHouseID"].ToString().Trim();
            int HouseID = int.Parse(sHouseID);

            string sPrice = fc["txtPrice"].ToString().Trim();
            float Price = float.Parse(sPrice);

            string sRoomNumber = fc["txtRoomNumber"].ToString().Trim();
            int RoomNumber = int.Parse(sRoomNumber);

            string sAcreage = fc["txtAcreage"].ToString().Trim();
            float Acreage = float.Parse(sAcreage);

            string sFloor = fc["txtFloor"].ToString().Trim();
            int Floor = int.Parse(sFloor);

            string sHouseNumber = fc["txtHouseNumber"].ToString().Trim();

            string sHouseStreet = fc["txtHouseStreet"].ToString().Trim();

            var sFurniture = fc["cbFurniture"];

            var sRentStatus = fc["cbRentStatus"];

            string sOrderDetails = fc["txtOrderDetails"].ToString().Trim();

            tbl_House house = db.tbl_House.SingleOrDefault(n => n.houseID == HouseID);


            house.price = Price;
            house.roomNumber = RoomNumber;
            house.acreage = Acreage;
            house.floor = Floor;
            house.houseNumber = sHouseNumber;
            house.houseStreet = sHouseStreet;

            if (sFurniture != null)
            {
                house.furniture = true;
            }
            else
            {
                house.furniture = false;
            }


            if (sRentStatus != null)
            {
                house.rentStatus = true;
            }
            else
            {
                house.rentStatus = false;
            }

            house.otherDetails = sOrderDetails;

            db.Entry(house).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

            House h = (House)Session["House"];
            h.house = house;

            return View();


        }

        //lay tat ca quan
        public PartialViewResult GetAllDistrictForAddNewPartial()
        {
            List<tbl_District> listDistrict = db.tbl_District.ToList();
            ViewBag.DistrictList = new SelectList(listDistrict, "districtID", "districtName");
            return PartialView();
        }

        [HttpGet]
        public ActionResult AddNewHouse()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddNewHouse(FormCollection fc)
        {
            string sEmail = fc["txtEmailAdmin"].ToString().Trim();

            string sPrice = fc["txtPrice"].ToString().Trim();
            float Price = float.Parse(sPrice);

            string sRoomNumber = fc["txtRoomNumber"].ToString().Trim();
            int RoomNumber = int.Parse(sRoomNumber);

            string sAcreage = fc["txtAcreage"].ToString().Trim();
            float Acreage = float.Parse(sAcreage);

            string sFloor = fc["txtFloor"].ToString().Trim();
            int Floor = int.Parse(sFloor);

            string sHouseNumber = fc["txtHouseNumber"].ToString().Trim();

            string sHouseStreet = fc["txtHouseStreet"].ToString().Trim();

            var sFurniture = fc["cbFurniture"];

            var sRentStatus = fc["cbRentStatus"];

            string sOrderDetails = fc["txtOrderDetails"].ToString().Trim();

            string sAreaID = fc["areaID"].ToString().Trim();
            int AreaID = int.Parse(sAreaID);

            string surl1 = fc["Image1"].ToString();
            string surl2 = fc["Image2"].ToString();
            string surl3 = fc["Image3"].ToString();

            tbl_House house = new tbl_House();
            house.emailAdmin = sEmail;
            house.price = Price;
            house.roomNumber = RoomNumber;

            if (sFurniture != null)
            {
                house.furniture = true;
            }
            else
            {
                house.furniture = false;
            }

            house.acreage = Acreage;
            house.floor = Floor;

            if (sRentStatus != null)
            {
                house.rentStatus = true;
            }
            else
            {
                house.rentStatus = false;
            }

            house.areaID = AreaID;
            house.houseNumber = sHouseNumber;
            house.houseStreet = sHouseStreet;
            house.otherDetails = sOrderDetails;

            db.tbl_House.Add(house);
            db.SaveChanges();

            //lấy nhà vừa được thêm
            List<tbl_House> listHouseAdded = db.tbl_House.Where(n => n.emailAdmin == house.emailAdmin
            && n.price == house.price && n.roomNumber == house.roomNumber && n.furniture == house.furniture
            && n.acreage == house.acreage && n.floor == house.floor && n.rentStatus == house.rentStatus
            && n.areaID == house.areaID && n.houseNumber == house.houseNumber && n.houseStreet == house.houseStreet
            && n.otherDetails == house.otherDetails).ToList();

            tbl_House houseAdded = (tbl_House)listHouseAdded[listHouseAdded.Count - 1];

            tbl_Image image = new tbl_Image();
            image.houseID = houseAdded.houseID;
            image.url = surl1;
            db.tbl_Image.Add(image);
            db.SaveChanges();

            image.url = surl2;
            db.tbl_Image.Add(image);
            db.SaveChanges();

            image.url = surl3;
            db.tbl_Image.Add(image);
            db.SaveChanges();


            return RedirectToAction("GetListHouseByAdmin", "Login");
        }
    }
}


