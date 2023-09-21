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
                conn = DriverManager.getConnection(jdbc_url, "scott", "tiger");
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
            pstmt.setString(5, boardDO.getPicture());


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

        sql = "update board set userId = ?, title = ?, contents = ?, area = ?" +
                "where boardNo = ?";

        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, boardDO.getUserId());
            pstmt.setString(2, boardDO.getTitle());
            pstmt.setString(3, boardDO.getContents());
            pstmt.setString(4, boardDO.getArea());

            pstmt.setInt(5, boardDO.getBoardNo());


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
    public int deleteBoard(int boardDO){
        int rowCount = 0;

        sql = "delete from board where boardNo = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, boardDO);

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
                boardDO.setBoardNo(rs.getInt("boardNo"));
                boardDO.setUserId(rs.getString("userId"));
                boardDO.setTitle(rs.getString("title"));
                boardDO.setArea(rs.getString("area"));
                boardDO.setContents(rs.getString("contents"));

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



    //하나의 게시글 불러오기
    public BoardDO getBoard(int boardNo){

        BoardDO boardDO = new BoardDO();
        sql = "select * from board where boardno = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, boardNo);

            rs = pstmt.executeQuery();

            while(rs.next()) {
                boardDO.setBoardNo(boardNo);
                boardDO.setUserId(rs.getString("userId"));
                boardDO.setTitle(rs.getString("title"));
                boardDO.setArea(rs.getString("area"));
                boardDO.setContents(rs.getString("contents"));
            }

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
        return boardDO;
    }

    //검색된 게시글 불러오기
    public ArrayList<BoardDO> getSearchBoard(String keyword){

        ArrayList<BoardDO> boardList = new ArrayList<BoardDO>();
        String keyword1 = "%" + keyword + "%";
        System.out.println(keyword1);
        sql = "select * from board where title like ? or contents like ? or area like ?";
        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1,keyword1);
            pstmt.setString(2,keyword1);
            pstmt.setString(3,keyword1);

            rs = pstmt.executeQuery();
            System.out.println(rs);

            while(rs.next()) {
            System.out.println(rs.getString("boardNo"));
                BoardDO boardDO = new BoardDO();
                boardDO.setBoardNo(rs.getInt("boardNo"));
                boardDO.setUserId(rs.getString("userId"));
                boardDO.setTitle(rs.getString("title"));
                boardDO.setContents(rs.getString("contents"));
                boardDO.setArea(rs.getString("area"));

                boardList.add(boardDO);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(pstmt != null) {
                try {
                    pstmt.close();
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return boardList;
    }
}

