package board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;
import common.JDBConnect;

public class BoardDAO extends JDBConnect {
    public BoardDAO(ServletContext application) {
        super(application);
    }

    // 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        return 0; 
    }
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다.
    public List<BoardDTO> selectList(Map<String, Object> map,String type) { 
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();
        String query = "select car_id, car_model, car_price, car_img from board where car_type=?";
        
        try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString("id"));
				dto.setModel(rs.getString("model"));
				dto.setPrice(rs.getInt("price"));				
				dto.setImg(rs.getString("img"));
				bbs.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("Exception[selectList] : " + e.getMessage());
			e.printStackTrace();
		}
    	
    	return bbs;
    }
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
//    public List<BoardDTO> selectListPage(Map<String, Object> map) {
//        
//        return null;
//    }

    // 게시글 데이터를 받아 DB에 추가합니다. 
//    public int insertWrite(BoardDTO dto) {
//    	int result = 0;
//        String query = "insert into board(num,title,content,id,visitcount) ";
//        query += "values (seq_board_num.NEXTVAL,?,?,?,?)";
//        try {
//        	pstmt = con.prepareStatement(query);
//        	pstmt.setString(1, dto.getTitle());
//        	pstmt.setString(2, dto.getContent());
//        	pstmt.setString(3, dto.getId());
//        	pstmt.setString(4, dto.getVisitcount());
//        	result = pstmt.executeUpdate();
//        }catch(Exception e) {
//			System.out.println("Exception[insertWrite] : " + e.getMessage());
//			e.printStackTrace();
//		}
//        return result;
//    }


    // 지정한 게시물을 찾아 내용을 반환합니다.
    public BoardDTO selectView(String id) { 
        BoardDTO dto = new BoardDTO();
        
        //String query = "select * from board where num=?";
        String query = "select car_id, car_model, car_brand, car_price, car_color, car_img ";
        query +=  "from car where car_id=?";
        try {
        	pstmt = con.prepareStatement(query);
        	pstmt.setString(1, id);
        	rs = pstmt.executeQuery();
        	if(rs.next()) {
        		dto.setId(rs.getString("id"));
				dto.setModel(rs.getString("model"));
				dto.setBrand(rs.getString("brand"));
				dto.setPrice(rs.getInt("price"));
				dto.setColor(rs.getString("color"));
				dto.setImg(rs.getString("img"));
        	}
        	rs.close();
			pstmt.close();
        }catch(Exception e) {
        	System.out.println("Exception[selectView] : " + e.getMessage());
			e.printStackTrace();
        }
    	
        return dto; 
    }

    // 지정한 게시물의 조회수를 1 증가시킵니다.
//    public void updateVisitCount(String num) { 
//                
//    }
    
    // 지정한 게시물을 수정합니다.
//    public int updateEdit(BoardDTO dto) { 
//        int result = 0;
//        try {
//        	String query = "UPDATE board SET title=?, content=? WHERE num=?";
//        	pstmt = con.prepareStatement(query);
//        	pstmt.setString(1, dto.getTitle());
//        	pstmt.setString(2, dto.getContent());
//        	pstmt.setString(3, dto.getNum());
//        	result = pstmt.executeUpdate();
//        }catch(Exception e) {
//        	System.out.println("Exception[updateEdit] : " + e.getMessage());
//			e.printStackTrace();
//        }
//        
//        return result;  
//    }
//
//    // 지정한 게시물을 삭제합니다.
//    public int deletePost(BoardDTO dto) { 
//    	int result = 0;
//        try {
//        	String query = "DELETE board WHERE num=?";
//        	pstmt = con.prepareStatement(query);
//        	pstmt.setString(1, dto.getNum());
//        	result = pstmt.executeUpdate();
//        }catch(Exception e) {
//        	System.out.println("Exception[deletePost] : " + e.getMessage());
//			e.printStackTrace();
//        }
//        return result;
//    }
}
