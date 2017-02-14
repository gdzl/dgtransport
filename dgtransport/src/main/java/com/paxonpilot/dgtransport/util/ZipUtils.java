package com.paxonpilot.dgtransport.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Created by Administrator on 2017/1/12.
 */
public class ZipUtils {
    public static void zipFile(String fileName, ZipOutputStream out) throws IOException {
        File file = new File(fileName);
        if(file.exists()){
            byte[] buffer = new byte[1024];
            FileInputStream fis = new FileInputStream(file);
            String name = file.getName();
            String name2 = null;
            if (name.contains("shenfenzheng")){
                name2 = name.replace("shenfenzheng","身份证");
            }else if (name.contains("congyezheng")){
                name2 = name.replace("congyezheng","从业资格证");
            }else if (name.contains("jiashizheng")){
                name2 = name.replace("jiashizheng","驾驶证");
            }else if (name.contains("laodonghetong")){
                name2 = name.replace("laodonghetong","劳动合同");
            }else if (name.contains("yueyanlianjilu")){
                name2 = name.replace("yueyanlianjilu","月度安全生产演练记录");
            }else if (name.contains("yuexunchajilu")){
                name2 = name.replace("yuexunchajilu","月度安全生产巡查记录");
            }else if (name.contains("jixunchajilu")){
                name2 = name.replace("jixunchajilu","季度安全生产巡查记录");
            }else if (name.contains("xingshizheng")){
                name2 = name.replace("xingshizheng","机动车行驶证");
            }else if (name.contains("dengjizheng")){
                name2 = name.replace("dengjizheng","机动车登记证书");
            }else if (name.contains("zerenxian")){
                name2 = name.replace("zerenxian","承运人责任险");
            }else if (name.contains("huanbaoTag")){
                name2 = name.replace("huanbaoTag","环保标志");
            }else if (name.contains("specialReport")){
                name2 = name.replace("specialReport","专项检测报告");
            }else if (name.contains("oilCastList")){
                name2 = name.replace("oilCastList","燃油消耗表");
            }else if (name.contains("gongshang")){
                name2 = name.replace("gongshang","工商营业执照");
            }else if (name.contains("anquanshengchan")){
                name2 = name.replace("anquanshengchan","安全生产管理制度");
            }else if (name.contains("anquanyingji")){
                name2 = name.replace("anquanyingji","安全应急制度");
            }else {
                if (name.contains("GPS")){
                    if (name.contains("GPSInstall")){
                        name2 = name.replace("GPSInstall","GPS安装证明");
                    }else {
                        name2 = name.replace("GPS","GPS接入证明");
                    }
                }
                if (name.contains("daolu")){
                    if (name.contains("daoluyunshu")){
                        name2 = name.replace("daoluyunshu","道路运输证");
                    }else {
                        name2 = name.replace("daolu","道路运输经营许可证");
                    }
                }

            }
            out.putNextEntry(new ZipEntry(name2));
            int len = 0 ;
            //读入需要下载的文件的内容，打包到zip文件
            while ((len = fis.read(buffer)) > 0) {
                out.write(buffer, 0, len);
            }
            out.flush();
            out.closeEntry();
            fis.close();
        }
    }

}
