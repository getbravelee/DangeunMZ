package model;
import java.sql.*;

public class MemberDAO {
    private Connection conn;
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
    //하나의 멤버 불러오기
    public MemberDO getMember(String userId){

        MemberDO memberDO = new MemberDO();
        sql = "select * from Member where userId = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);

            rs = pstmt.executeQuery();
            if(rs.next()) {
                memberDO.setUserId(rs.getString("userId"));
                memberDO.setPassword(rs.getString("password"));
                memberDO.setEmail(rs.getString("email"));
                memberDO.setName(rs.getString("name"));
                memberDO.setGender(rs.getString("gender"));
                memberDO.setArea(rs.getString("area"));
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

        return memberDO;
    }

    //로그인
    public int isLogin(String userId, String password) {

        sql = "select password from member where userId =?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if(rs.getString(1).equals(password)) {
                    return 1; // 로그인 성공
                }
                else
                    return 0; // 비밀번호 불일치
            }
            return -1;	// 아이디가 없음

        } catch (Exception e) {
            e.printStackTrace();

        }
        return -2; // 데이터베이스 오류
    }

    // 회원가입
    public int insertMember(MemberDO memberDO) {
        int rowCount = 0;

        if(checkMember(memberDO)){

            sql = "insert into member (userId, password, email, name, gender, area) values (?,?,?,?,?,?)";

            try{
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, memberDO.getUserId());
                pstmt.setString(2, memberDO.getPassword());
                pstmt.setString(3, memberDO.getEmail());
                pstmt.setString(4, memberDO.getName());
                pstmt.setString(5, memberDO.getGender());
                pstmt.setString(6, memberDO.getArea());
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
    public boolean checkMember(MemberDO memberDO) {
        boolean checkResult = true;

        try{
            sql = "select userId from member where userId = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDO.getUserId());

            rs = pstmt.executeQuery();
            if(rs.next()) {
                checkResult = false;
            }
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

        return checkResult;
    }
    //회원 정보 수정
    public int updateMember(MemberDO memberDO) {
        int rowCount = 0;

        sql = "update member set password = ?, email = ?, name = ?, gender = ?, area = ? where userId = ?";

        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDO.getPassword());
            pstmt.setString(2, memberDO.getEmail());
            pstmt.setString(3, memberDO.getName());
            pstmt.setString(4, memberDO.getGender());
            pstmt.setString(5, memberDO.getArea());
            pstmt.setString(6, memberDO.getUserId());
            rowCount = pstmt.executeUpdate();

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

    // 회원탈퇴(탈퇴 성공시 1 / 실패시 0 반환)
    public int deleteMember(String userId, String password) {
        int rowCount = 0;

        if(isLogin(userId, password) == 1) {

            sql = "delete from member where userId = ?";

            try{
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, userId);

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
}