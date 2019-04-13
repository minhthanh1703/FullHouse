using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using PagedList;
using FullHouseWebsite.Models;
using System.Data;

namespace FullHouseWebsite.Controllers
{
    public class SearchController : Controller
    {
        FullHouseEntities db = new FullHouseEntities();
       

        [HttpPost]
        public ActionResult SearchResult(FormCollection fc, int? page)
        {
            string sDistrictID = fc["districtID"].ToString().Trim();
            string sAreaID = fc["areaID"].ToString().Trim();
            string sPriceFrom = fc["txtSearchPriceFrom"].ToString().Trim();
            string sPriceTo = fc["txtSearchPriceTo"].ToString().Trim();

            ViewBag.districID = sDistrictID;
            ViewBag.areaID = sAreaID;
            ViewBag.priceForm = sPriceFrom;
            ViewBag.PriceTo = sPriceTo;

            TempData["districID"] = sDistrictID;
            
            TempData["areaID"] = sAreaID;
            TempData["priceForm"] = sPriceFrom;
            TempData["PriceTo"] = sPriceTo;

            int districtID = -1;
            if(sDistrictID != "")
            {
                districtID = int.Parse(sDistrictID);
                TempData["districName"] = db.tbl_District.SingleOrDefault(n => n.districtID == districtID).districtName;
            }
            int areaID = -1;
            if(sAreaID != "")
            {
                areaID = int.Parse(sAreaID);
            }
            double priceFrom = -1;
            if(sPriceFrom != "")
            {
                priceFrom = double.Parse(sPriceFrom);
            }
            double priceTo = -1;
            if(sPriceTo != "")
            {
                priceTo = double.Parse(sPriceTo);
            }

            var listResult = new List<GetListSearchFromProcedure>();
            if (areaID !=  -1 && priceFrom != -1 && priceTo != -1)
            {               
              listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_District_Area_Price @districtID=" + districtID + ", @areaID= " + areaID + ", @PriceFrom=" + priceFrom + ", @PriceTo=" + priceTo).ToList();
            }
            else if (areaID != -1 && priceFrom == -1 && priceTo == -1)
            {
                 listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_District_Area @districtID=" + districtID + ", @areaID= " + areaID).ToList();
            }
            else if (areaID == -1 && priceFrom != -1 && priceTo != -1)
            {
                listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_Price  @PriceFrom=" + priceFrom + ", @PriceTo=" + priceTo).ToList();
            }
            else if (areaID != -1 && priceFrom != -1 && priceTo == -1)
            {
                listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_District_Area_PriceFrom @districtID=" + districtID + ", @areaID= " + areaID + ", @PriceFrom=" + priceFrom).ToList();
            }
            else if (areaID != -1 && priceFrom == -1 && priceTo != -1)
            {
                 listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_District_Area_PriceTo @districtID=" + districtID + ", @areaID= " + areaID + ", @PriceTo=" + priceTo).ToList();
            }
            else if (areaID == -1 && priceFrom != -1 && priceTo == -1)
            {
                 listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_PriceFrom  @PriceFrom=" + priceFrom).ToList();
            }
            else if (areaID == -1 && priceFrom == -1 && priceTo != -1)
            {
                 listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_PriceTo  @PriceTo=" + priceTo).ToList();
            }



            List<SearchModel> result = new List<SearchModel>();
            foreach (var item in listResult)
            {
                SearchModel searchModel = new SearchModel {
                districtName = item.districtName,
                areaName = item.areaName,
                houseID = item.houseID,
                price = item.price,
                roomNumber = item.roomNumber,
                acreage = item.acreage,
                houseStreet = item.houseStreet,
                listImage = db.tbl_Image.Where(n => n.houseID == item.houseID).ToList(),
                floor = item.floor,
                furniture = item.furniture,
                houseNumber = item.houseNumber
            };

                
                result.Add(searchModel);
            }
            

            //Phân trang
            int pageNumber = (page ?? 1);
            int pageSize = 9;

            return View(result.ToPagedList(pageNumber,pageSize));
        }


        [HttpGet]
        public ActionResult SearchResult(string sDistrictID, string sAreaID, string sPriceFrom,  string sPriceTo,  int? page)
        {

            ViewBag.districID = sDistrictID;
            ViewBag.areaID = sAreaID;
            ViewBag.priceForm = sPriceFrom;
            ViewBag.PriceTo = sPriceTo;

            int districtID = -1;
            if (sDistrictID != null)
            {
                districtID = int.Parse(sDistrictID);
            }
            int areaID = -1;
            if (sAreaID != null)
            {
                areaID = int.Parse(sAreaID);
            }
            double priceFrom = -1;
            if (sPriceFrom != null)
            {
                priceFrom = double.Parse(sPriceFrom);
            }
            double priceTo = -1;
            if (sPriceTo != null)
            {
                priceTo = double.Parse(sPriceTo);
            }

            var listResult = new List<GetListSearchFromProcedure>();
            if (areaID != -1 && priceFrom != -1 && priceTo != -1)
            {
                listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_District_Area_Price @districtID=" + districtID + ", @areaID= " + areaID + ", @PriceFrom=" + priceFrom + ", @PriceTo=" + priceTo).ToList();
            }
            else if (areaID != -1 && priceFrom == -1 && priceTo == -1)
            {
                listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_District_Area @districtID=" + districtID + ", @areaID= " + areaID).ToList();
            }
            else if (areaID == -1 && priceFrom != -1 && priceTo != -1)
            {
                listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_Price  @PriceFrom=" + priceFrom + ", @PriceTo=" + priceTo).ToList();
            }
            else if (areaID != -1 && priceFrom != -1 && priceTo == -1)
            {
                listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_District_Area_PriceFrom @districtID=" + districtID + ", @areaID= " + areaID + ", @PriceFrom=" + priceFrom).ToList();
            }
            else if (areaID != -1 && priceFrom == -1 && priceTo != -1)
            {
                listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_District_Area_PriceTo @districtID=" + districtID + ", @areaID= " + areaID + ", @PriceTo=" + priceTo).ToList();
            }
            else if (areaID == -1 && priceFrom != -1 && priceTo == -1)
            {
                listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_PriceFrom  @PriceFrom=" + priceFrom).ToList();
            }
            else if (areaID == -1 && priceFrom == -1 && priceTo != -1)
            {
                listResult = db.Database.SqlQuery<GetListSearchFromProcedure>("search_PriceTo  @PriceTo=" + priceTo).ToList();
            }



            List<SearchModel> result = new List<SearchModel>();
            foreach (var item in listResult)
            {
                SearchModel searchModel = new SearchModel
                {
                    districtName = item.districtName,
                    areaName = item.areaName,
                    houseID = item.houseID,
                    price = item.price,
                    roomNumber = item.roomNumber,
                    acreage = item.acreage,
                    houseStreet = item.houseStreet,
                    listImage = db.tbl_Image.Where(n => n.houseID == item.houseID).ToList(),
                    floor = item.floor,
                    furniture = item.furniture,
                    houseNumber = item.houseNumber
                };


                result.Add(searchModel);
            }


            //Phân trang
            int pageNumber = (page ?? 1);
            int pageSize = 9;

            return View(result.ToPagedList(pageNumber, pageSize));
        }

    }
}
