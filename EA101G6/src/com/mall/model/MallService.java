package com.mall.model;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import com.gmType.model.GmTypeVO;

public class MallService {

	private MallDAO_interface dao ;
	
	public MallService() {
		dao = new MallJDBCDAO();
	}
	
	//新增ok
	public String add(String commName, Integer price, Integer quantity, byte[] img, String intro,
			String age, String player, Integer status) {
		try {
			MallVO mall = new MallVO();
			mall.setCommName(commName);
			mall.setPrice(price);
			mall.setQuantity(quantity);
			mall.setImg(img);
			mall.setIntro(intro);
			mall.setAge(age);
			mall.setPlayer(player);
			mall.setStatus(status);
			dao.add(mall);
		}catch(Exception e) {
			System.out.println("malladd錯了");
			e.getStackTrace();
			return "新增失敗";
		}
		return "新增成功";
		
		
	}
	//刪除ok
	public String delete(String commno){
		
		dao.delete(commno);
		
		return "刪除成功";
	}
	//修改ok
	public String update(String commNo, String commName, Integer price, Integer quantity, byte[] img, String intro,
			String age, String player, Integer status){
		try {
			MallVO mall = new MallVO();
			mall.setCommNo(commNo);
			mall.setCommName(commName);
			mall.setPrice(price);
			mall.setQuantity(quantity);
			mall.setImg(img);
			mall.setIntro(intro);
			mall.setAge(age);
			mall.setPlayer(player);
			mall.setStatus(status);
			dao.update(mall);
		}catch(Exception e) {
			System.out.println("mallupdate錯了");
			e.getStackTrace();
			return "修改失敗";
		}
		return "修改成功";
		
		
	}
	//用商品名稱查詢，因為我查的可能不只一項回傳list ok
	public List<MallVO> findByName(String name){
		return dao.findByName(name);
		
	}
	//拿全部ok
	public List<MallVO> getAll(){
		return dao.getAll();
		
	}
	//取得最新商品前五比 ok
	public List<MallVO> getNew(){
		return dao.getNew();
		
	}
	//ok
	public MallVO getOneByNo(String commNo){
		return dao.getOneByNo(commNo);
		
	}
	
	public List<GmTypeVO> getType(String commNo){
		return dao.getType(commNo);
	}
	/**
	public static void main(String[] args) {
		MallService ser = new MallService();
		以下為test
		byte[] img =null ;
		try {
			FileInputStream in =new FileInputStream(new File("C:\\Users\\Java\\Desktop\\WORKSQL\\MALLIMG\\1.jpg"));
			BufferedInputStream bufin =new BufferedInputStream(in);
			byte[] buffer = new byte[2048];
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			
			while(bufin.read(buffer,0,2048)!=-1) 
				baos.write(buffer);
				
			img =baos.toByteArray();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		add ok delete ok update ok findbyname ok
		ser.add("大富翁", 1000, 20, img, "大家一起來玩吧","4-6","8歲以上", 0);
		ser.delete("11");
		ser.update("ZM00012","豪華版大富翁", 1000, 20, img, "大家一起來玩吧","4-6","8歲以上", 0);
		List<MallVO> list=ser.getAll();
		for(MallVO vo : list)
			System.out.println(vo.getCommNo()+vo.getCommName());
	
		//System.out.println(ser.getOneByNo("ZM00012").getCommName());
		List<String> list =ser.getType("ZM00009");
		for(String x : list)
			System.out.println(x);
		
	}**/
	
	
}
