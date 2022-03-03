<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
* {
   margin: 0;
   padding: 0;
   box-sizing: border-box;
   /* font-family: "Noto Sans KR", sans-serif; */
}

a {
   text-decoration: none;
   color: black;
}

/* li {
   list-style: none;
} */
.wrap {
   width: 100%;
   height: 100%;
   display: flex;
   align-items: center;
   justify-content: center;
   background: rgba(0, 0, 0, 0);
}

.login {
   width: 500px;
   height: 90%;
   background: white;
   border-radius: 20px;
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
   margin-top: 30px;
}

h2 {
   color: #6667AB;
   font-size: 2em;
}

.title {
   margin-top: 20px;
}

.login_sns {
   padding: 20px;
   display: flex;
}

.login_sns li {
   padding: 0px 15px;
}

.login_sns a {
   width: 50px;
   height: 50px;
   display: flex;
   align-items: center;
   justify-content: center;
   padding: 10px;
   border-radius: 50px;
   background: white;
   font-size: 20px;
   box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.4), -3px -3px 5px
      rgba(0, 0, 0, 0.1);
}

.login_id {
   margin-top: 20px;
   margin-bottom: 10px;
   width: 80%;
   text-align: center;
}

.login_id input {
   width: 100%;
   height: 50px;
   border-radius: 30px;
   margin-top: 10px;
   padding: 0px 20px;
   border: 1px solid lightgray;
   outline: none;
}

.login_pw {
   margin-top: 10px;
   margin-bottom: 10px;
   width: 80%;
   text-align: center;
}

.login_pw input {
   width: 100%;
   height: 50px;
   border-radius: 30px;
   margin-top: 10px;
   padding: 0px 20px;
   border: 1px solid lightgray;
   outline: none;
}

.login_etc {
   padding: 10px;
   width: 80%;
   font-size: 14px;
   display: flex;
   justify-content: space-between;
   align-items: center;
   font-weight: bold;
}

.submit {
   margin-top: 20px;
   width: 80%;
}

.submit input {
   width: 100%;
   height: 50px;
   border: 0;
   outline: none;
   border-radius: 40px;
   background: linear-gradient(to left, white, #6667AB);
   color: white;
   font-size: 1.2em;
   letter-spacing: 2px;
}

.back {
   margin: 10px;
}

.reset {
   background-color: white;
   color: black;
   border: 2px solid #f44336;
   border-radius: 30px;
   margin-top: 10px;
   padding: 10px 10px;
   border: 1px solid lightgray;
   outline: none;
}

.reset:hover {
   background-color: #f44336;
   color: white;
}

input {
   cursor: pointer;
}

.select {
   margin-top: 10px;
   margin-bottom: 10px;
   width: 100%;
   text-align: center;
}

#region {
   margin-top: 10px;
   width: 80%;
   height: 50px;
   border-radius: 30px;
   border: 1px solid lightgray;
   padding: 10px 20px 10px 20px;
}
</style>
</style>
</head>

<body>
   <div class="wrap">
      <form method="post" action="insert">
         <div class="login">
            <h2 class="title">회원가입</h2>
            <div class="login_id">
               <h4>Name</h4>
               <input type="text" name="name" id="name" placeholder="본인의 이름을 입력해주세요">
            </div>
            <div class="login_pw">
               <h4>ID</h4>
               <input type="text" name="id" id="id" placeholder="사용하실 아이디를 입력해주세요">
            </div>
            <div class="login_pw">
               <h4>Password</h4>
               <input type="password" name="pwd" id="pwd"
                  placeholder="비밀번호를 입력해주세요">
            </div>
            <div class="login_pw">
               <h4>Check Password</h4>
               <input type="password" name="pwdck" id="pwdck"
                  placeholder="비밀번호를 확인해주세요">
            </div>
            <input type="reset" value="초기화" class="reset" />

            <div class="submit">
               <input type="submit" value="submit">
            </div>
            <div class="back">
               <a href='index.html'>메인페이지로 이동</a>
            </div>
         </div>
      </form>
   </div>

</body>

</html>