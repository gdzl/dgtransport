package com.paxonpilot.dgtransport.controller;

import com.paxonpilot.dgtransport.entity.Annex;
import com.paxonpilot.dgtransport.entity.AnnexDetail;
import com.paxonpilot.dgtransport.service.AnnuxSerivceImpl;
import com.paxonpilot.dgtransport.service.TaskServiceImpl;
import com.paxonpilot.dgtransport.util.ZipUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.zip.ZipOutputStream;

@Controller
public class UploadController extends BaseController{

    @Autowired
    private AnnuxSerivceImpl annuxSerivce;

    /**
     * 打包压缩下载文件
     */
    @RequestMapping(value = "/downLoadZipFile")
    public void downLoadZipFile(@RequestParam Long entityId, @RequestParam Integer entityType, @RequestParam String downloadName, HttpServletResponse response, HttpServletRequest request) throws IOException {
//        String zipName = entityId + ".zip";
        String zipName = downloadName + ".zip";
        String path = request.getSession().getServletContext().getRealPath("");
        Object[] params = new Object[] { entityId,entityType };
        List list = annuxSerivce.getFileBeanByMap(params);
        response.setContentType("APPLICATION/OCTET-STREAM");
        //防止压缩包中文乱码
//        response.setHeader("Content-Disposition","attachment; filename="+java.net.URLEncoder.encode(zipName,"UTF-8"));
        response.setHeader("Content-Disposition","attachment; filename="+new String(zipName.getBytes("utf-8"),"iso-8859-1"));
        ZipOutputStream out = new ZipOutputStream(response.getOutputStream());
        try {
            for(int i=0;i<list.size();i++){
                String filePath = (String) list.get(i);
                ZipUtils.zipFile(path + filePath, out);
                response.flushBuffer();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            out.close();
        }
    }

}
