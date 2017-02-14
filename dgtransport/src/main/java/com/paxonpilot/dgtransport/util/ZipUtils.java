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
                name2 = name.replace("shenfenzheng","���֤");
            }else if (name.contains("congyezheng")){
                name2 = name.replace("congyezheng","��ҵ�ʸ�֤");
            }else if (name.contains("jiashizheng")){
                name2 = name.replace("jiashizheng","��ʻ֤");
            }else if (name.contains("laodonghetong")){
                name2 = name.replace("laodonghetong","�Ͷ���ͬ");
            }else if (name.contains("yueyanlianjilu")){
                name2 = name.replace("yueyanlianjilu","�¶Ȱ�ȫ����������¼");
            }else if (name.contains("yuexunchajilu")){
                name2 = name.replace("yuexunchajilu","�¶Ȱ�ȫ����Ѳ���¼");
            }else if (name.contains("jixunchajilu")){
                name2 = name.replace("jixunchajilu","���Ȱ�ȫ����Ѳ���¼");
            }else if (name.contains("xingshizheng")){
                name2 = name.replace("xingshizheng","��������ʻ֤");
            }else if (name.contains("dengjizheng")){
                name2 = name.replace("dengjizheng","�������Ǽ�֤��");
            }else if (name.contains("zerenxian")){
                name2 = name.replace("zerenxian","������������");
            }else if (name.contains("huanbaoTag")){
                name2 = name.replace("huanbaoTag","������־");
            }else if (name.contains("specialReport")){
                name2 = name.replace("specialReport","ר���ⱨ��");
            }else if (name.contains("oilCastList")){
                name2 = name.replace("oilCastList","ȼ�����ı�");
            }else if (name.contains("gongshang")){
                name2 = name.replace("gongshang","����Ӫҵִ��");
            }else if (name.contains("anquanshengchan")){
                name2 = name.replace("anquanshengchan","��ȫ���������ƶ�");
            }else if (name.contains("anquanyingji")){
                name2 = name.replace("anquanyingji","��ȫӦ���ƶ�");
            }else {
                if (name.contains("GPS")){
                    if (name.contains("GPSInstall")){
                        name2 = name.replace("GPSInstall","GPS��װ֤��");
                    }else {
                        name2 = name.replace("GPS","GPS����֤��");
                    }
                }
                if (name.contains("daolu")){
                    if (name.contains("daoluyunshu")){
                        name2 = name.replace("daoluyunshu","��·����֤");
                    }else {
                        name2 = name.replace("daolu","��·���侭Ӫ���֤");
                    }
                }

            }
            out.putNextEntry(new ZipEntry(name2));
            int len = 0 ;
            //������Ҫ���ص��ļ������ݣ������zip�ļ�
            while ((len = fis.read(buffer)) > 0) {
                out.write(buffer, 0, len);
            }
            out.flush();
            out.closeEntry();
            fis.close();
        }
    }

}
