<section class="user-join">
	<div class="container">
		<div style="margin-left: 5%;">
			<p class="demand">2. 다음의 빈칸을 모두 채우시오</p>
			<form action="http://localhost:8000/api/member/email" method="post" id="loginForm">
				<div class="input">
					<label for="email" class="email">이메일:</label>
					<input type="text" id="email" name="email">
				</div>
				<div class="input">
					<label for="password" class="password">비밀번호:</label>
					<input type="text" id="password" name="password">
				</div>
				<div class="input">
					<label for="nickname" class="nickname">닉네임:</label>
					<input type="text" id="nickname" name="nickname">
				</div>
				<div class="input last">
					<label for="department" class="department">학과:</label>
					<input type="text" id="oranization" name="organization">
				</div>
				<div class="join-button-group">
					<div class="a">
						<input type="submit" class="button" value="회원가입"/>
						<button type="button" class="button">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>