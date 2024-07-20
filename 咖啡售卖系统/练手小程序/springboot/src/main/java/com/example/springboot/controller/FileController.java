package com.example.springboot.controller;


import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Dict;
import com.example.springboot.common.AuthAccess;
import com.example.springboot.common.HoneyLogs;
import com.example.springboot.common.LogType;
import com.example.springboot.common.Result;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@RestController
@RequestMapping("/file")
public class FileController {


    @Value("${ip}")
    String ip;

    @Value("${server.port}")
    String port;

                                    //D:\学习\java\lilil(vue)\files
    private static final String ROOT_PATH = System.getProperty("user.dir") + File.separator + "files";

    /*
    * 单文件上传接口
    * */

    @PostMapping("/upload")
    public Result upload(MultipartFile file) throws IOException {

        String originalFilename = file.getOriginalFilename();  //文件的原始名称

        String mainName = FileUtil.mainName(originalFilename);  //不包含文件后缀的名称
        String extName = FileUtil.extName(originalFilename);    //文件后缀
        //String fileName =originalFilename;  //实际存储到磁盘文件的名称

        if(!FileUtil.exist(ROOT_PATH)){
           FileUtil.mkdir(ROOT_PATH); //如果当前文件的父级目录 files 不存在，创建files
        }
                                            // File.separator 分隔符  \
        if(FileUtil.exist(ROOT_PATH + File.separator +originalFilename)){  //如果当前的文件已经存在，就需要重命名
            originalFilename = System.currentTimeMillis()+"_"+mainName+"."+extName;
        }
        File saveFile = new File(ROOT_PATH + File.separator + originalFilename);
        file.transferTo(saveFile); //存储文件到本地磁盘里面去

        String url = "http://"+ ip + ":" + port + "/file/download/" + originalFilename;
        return Result.success(url); //返回文件的连接，这个链接就是文件的下载地址

    }

    /*
    * 文件下载接口
    * hutool工具 使用FileUtil
    * */
    @HoneyLogs(operation = "文件上传",type = LogType.ADD)
    @AuthAccess
    @GetMapping ("/download/{fileName}")
    public void download(@PathVariable String fileName, HttpServletResponse response) throws IOException {
       /* response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));  // 附件下载
        response.addHeader("Content-Disposition", "inline;filename=" + URLEncoder.encode(fileName, "UTF-8")); //预览*/
        String filePAth = ROOT_PATH + File.separator + fileName;
        if(!FileUtil.exist(filePAth)){
            return;
        }
        byte[] bytes = FileUtil.readBytes(filePAth);
        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.write(bytes);  //数组是一个字节数组，也是文件的字节流数组
        outputStream.flush();
        outputStream.close();

    }

    @HoneyLogs(operation = "文件下载",type = LogType.ADD)
    @PostMapping("/editor/upload")
    public Dict editorupload(MultipartFile file) throws IOException {

        String originalFilename = file.getOriginalFilename();  //文件的原始名称
        String mainName = FileUtil.mainName(originalFilename);  //不包含文件后缀的名称
        String extName = FileUtil.extName(originalFilename);    //文件后缀
        //String fileName =originalFilename;  //实际存储到磁盘文件的名称

        if(!FileUtil.exist(ROOT_PATH)){
            FileUtil.mkdir(ROOT_PATH); //如果当前文件的父级目录 files 不存在，创建files
        }
        // File.separator 分隔符  \
        if(FileUtil.exist(ROOT_PATH + File.separator +originalFilename)){  //如果当前的文件已经存在，就需要重命名
            originalFilename = System.currentTimeMillis()+"_"+mainName+"."+extName;
        }
        File saveFile = new File(ROOT_PATH + File.separator + originalFilename);
        file.transferTo(saveFile); //存储文件到本地磁盘里面去

        String url = "http://"+ ip + ":" + port + "/file/download/" + originalFilename;

        Dict dict = Dict.create().set("errno", 0).set("data", CollUtil.newArrayList(Dict.create().set("url", url)));
        return dict; //返回文件的连接，这个链接就是文件的下载地址

    }

}
