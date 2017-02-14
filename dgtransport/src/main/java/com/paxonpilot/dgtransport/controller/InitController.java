package com.paxonpilot.dgtransport.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.paxonpilot.dgtransport.annotation.ControllerLogDesc;
import com.paxonpilot.dgtransport.entity.City;
import com.paxonpilot.dgtransport.entity.Employee;
import com.paxonpilot.dgtransport.entity.Province;
import com.paxonpilot.dgtransport.service.CityServiceImpl;
import com.paxonpilot.dgtransport.service.ProvinceServiceImpl;
import com.paxonpilot.dgtransport.util.AppContant;

import net.sf.json.JSONObject;

@Controller
public class InitController extends BaseController {

    @Autowired
    public ProvinceServiceImpl provinceService;
    @Autowired
    public CityServiceImpl cityService;

    @RequestMapping(value = "/init")
    public String bgHome() {

        return "init";
    }

    @RequestMapping(value = "/initImport")
    public String employeeUpload(@RequestParam("initExcel") MultipartFile initExcel,
                                 HttpServletRequest request, HttpServletResponse response) {
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        HSSFWorkbook book = null;
        List<Province> provinceList = new ArrayList<Province>();
        List<City> cityList = new ArrayList<City>();
        Map<String, Object> msg = new HashMap<String, Object>();
        PrintWriter out = null;
        int i = 0;
        short j = 0;
        try {
            out = response.getWriter();
            book = new HSSFWorkbook(initExcel.getInputStream());
            HSSFSheet sheet = book.getSheetAt(0);
            for (i = 0; i <= sheet.getLastRowNum(); i++) {
                HSSFRow row = sheet.getRow(i);
                Province province = new Province();
                for (j = 0; j < row.getLastCellNum(); j++) {
                    City city = new City();
                    HSSFCell cell = row.getCell((int) j);
                    cell.setCellType(Cell.CELL_TYPE_STRING);
                    String val = cell.getStringCellValue().trim();
                    if (!val.equals("")) {
                        System.out.println(val);
                        if (j == 0) {
                            province.setProvinceName(val);
                            Long id = provinceService.addEntityReturn(province);
//                			province.setId(id);
                        } else {
                            city.setCityName(val);
                            city.setProvinceNo(province.getId());
                            cityList.add(city);
                        }
                    }
                }
            }
            msg.put("msg", "success");
        } catch (Exception e) {
            e.printStackTrace();
            msg.put("msg", "faild");
            msg.put("detail", "第" + (i + 1) + "行，第" + (j + 1) + "列数据有问题，请检查后再导入");
        }
//		for(Province province : provinceList){
//			try {
//				provinceService.addEntity(province);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
        for (City city : cityList) {
            try {
                cityService.addEntity(city);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        out.print(JSONObject.fromObject(msg).toString());
        return null;
    }

    public ProvinceServiceImpl getProvinceService() {
        return provinceService;
    }

    public void setProvinceService(ProvinceServiceImpl provinceService) {
        this.provinceService = provinceService;
    }

    public CityServiceImpl getCityService() {
        return cityService;
    }

    public void setCityService(CityServiceImpl cityService) {
        this.cityService = cityService;
    }

}
