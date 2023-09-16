package model;
import java.sql.*;
import java.util.ArrayList;


public class MemberDAO {
    private Connection conn;
    private Statement stmt;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private String sql;

    public MemberDAO() {
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

    // 회원가입
    public int insertMemberInfo(MemberDO memberDO) {
        int rowCount = 0;

        ResultSet checkMember = checkMemberInfo(memberDO);

        if(checkMember == null){

            sql = "insert into member (userId, password) values (?,?)";

            try{
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, memberDO.getUserId());
                pstmt.setString(2, memberDO.getPassword());

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
        }
        return rowCount;
    }

    // 회원 중복 확인
    public ResultSet checkMemberInfo(MemberDO memberDO) {

        sql = "select * from member where userId = ?";

        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDO.getUserId());

            rs = pstmt.executeQuery();
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

        return rs;
    }

    // 회원탈퇴
    public int deleteMemberInfo(MemberDO memberDO) {
        int rowCount = 0;

        //애매하네 찾아보기
        sql = "delete from member where userId = ?";

        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDO.getUserId());

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
}
