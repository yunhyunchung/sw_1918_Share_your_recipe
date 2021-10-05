<!-- 식품 영양 정보 검색 jsp db와 연결해서 데이터 가져옴. 10/02 -->
<%@ page language="java" contentType = "text/html;charset=utf-8" 
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Search FoodNutrients</title>
	</head>
	<body>
		<h1>
			검색3
		</h1>
	<%
		request.setCharacterEncoding("utf-8");
		String fname=request.getParameter("foodname");
		
		
		Connection conn=null;
		Statement stmt=null;

		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/fndb", "project","recipe"
			);

			if(conn==null)
				throw new Exception("데이터베이스 연결 실패");
			stmt=conn.createStatement();

			ResultSet rs=stmt.executeQuery("select * from fnTable where fname like="+fname+"%");

			if(!rs.next()){
				out.println("해당하는 정보가 없습니다.");
			}else{
				rs.previous();
			}

			while(rs.next()){
				String fname2=rs.getString("fname");
				String cl1=rs.getString("cl1");
				String cl2=rs.getString("cl2");
				String onesvs=rs.getString("1svs");
				String kcal=rs.getString("kcal");
				String protein_g=rs.getString("protein_g");
				String fat_g=rs.getString("fat_g");
				String carbo_g=rs.getString("carbo_g");
				String sugar_g=rs.getString("sugar_g");
				String calc_mg=rs.getString("calc_mg");
				String pota_mg=rs.getString("pota_mg");
				String salt_mg=rs.getString("salt_mg");

				out.println("<br> 식품명 : "+fname2+" 대분류 : "+cl1+" 소분류 : "+cl2+
						   " 1회 제공량 : "+onesvs+" 열량 : "+kcal+" 단백질 : "+protein_g +
							" 지방 : "+fat_g+" 탄수화물 : "+carbo_g+" 당류 : "+sugar_g+
						   " 칼슘 : "+calc_mg+ "칼륨 : "+pota_mg+" 나트퓸 : "+salt_mg);

			}
		}finally{

		}
	%> 

	</body>
	

	
</html>

