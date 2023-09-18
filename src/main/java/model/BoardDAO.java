package model;

import java.sql.*;
import java.util.ArrayList;

public class BoardDAO {

    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private String sql;

    public BoardDAO() {
        String jdbc_driver = "oracle.jdbc.driver.OracleDriver";
        String jdbc_url = "jdbc:oracle:thin:@localhost:1521:XE";

        if(conn == null){
            try{
                Class.forName(jdbc_driver);
                conn = DriverManager.getConnection(jdbc_url, "system", "oracle");
            }
            catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    //게시글 작성
    public int insertBoard (BoardDO boardDO) {
        int rowCount = 0;
        sql = "insert into board (boardNo,userId, title, area, contents) values (seq_boardno.nextval,?, ?, ?, ?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, boardDO.getUserId());
            pstmt.setString(2, boardDO.getTitle());
            pstmt.setString(3, boardDO.getArea());
            pstmt.setString(4, boardDO.getContents());

            rowCount = pstmt.executeUpdate();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally {
            if(pstmt != null) {
                try {
                    pstmt.close();
                }
                catch(Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return rowCount;
    }

//    게시글 수정
    public int updateBoard(BoardDO boardDO){
        int rowCount = 0;

        sql = "update board set userId = ?, title = ?, contents = ?, area = ?, picture = ?, writedate = ? " +
                "where boardNo = ?";

        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, boardDO.getUserId());
            pstmt.setString(2, boardDO.getTitle());
            pstmt.setString(3, boardDO.getContents());
            pstmt.setString(4, boardDO.getArea());
//            pstmt.setString(5, boardDO.getPicture());
//            pstmt.setString(6, boardDO.getWritedate());
            pstmt.setInt(7, boardDO.getBoardNo());


            rowCount = pstmt.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally{
            if(pstmt != null){
                try{
                    pstmt.close();
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return rowCount;
    }

//    게시글 삭제
    public int deleteBoard(BoardDO boardDO){
        int rowCount = 0;

        sql = "delete from board where boardNo = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, boardDO.getBoardNo());

            rowCount = pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            if(pstmt != null){
                try{
                    pstmt.close();
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            }
        }

        return rowCount;
    }

    //전체 게시글 불러오기
    public ArrayList<BoardDO> getAllBoard () {
        ArrayList<BoardDO> boardList = new ArrayList<BoardDO>();
        sql = "select * from board";

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while(rs.next()) {
                BoardDO boardDO = new BoardDO();
                boardDO.setUserId(rs.getString("userId"));
                boardDO.setTitle(rs.getString("title"));
                boardDO.setArea(rs.getString("area"));
                boardDO.setContents(rs.getString("contents"));

                boardList.add(boardDO);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally {
            if(stmt != null) {
                try {
                    stmt.close();
                }
                catch(Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return boardList;
    }

//    검색된 게시글 불러오기
    public ArrayList<BoardDO> getSearchBoard(String keyword){

        ArrayList<BoardDO> boardList = new ArrayList<BoardDO>();
        sql = "select * from board where title like ? or contents like ? or area like ?";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery(sql);
            pstmt.setString(1,"%" + keyword + "%");
            pstmt.setString(2,"%" + keyword + "%");
            pstmt.setString(3,"%" + keyword + "%");

            while(rs.next()) {
                BoardDO boardDO = new BoardDO();
                boardDO.setUserId(rs.getString("userId"));
                boardDO.setTitle(rs.getString("title"));
                boardDO.setContents(rs.getString("contents"));
                boardDO.setArea(rs.getString("area"));
//                boardDO.setPicture(rs.getString("picture"));
//                boardDO.setWritedate(rs.getString("writedate"));

                boardList.add(boardDO);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(stmt != null) {
                try {
                    stmt.close();
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return boardList;
    }
}

