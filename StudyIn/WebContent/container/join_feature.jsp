<section class="user-join">
	<div class="container">
		<div style="margin-left: 5%;">
			<p class="demand">2. 다음의 빈칸을 모두 채우시오</p>
			<form action="./join_process.jsp" method="post" id="loginForm">
				<div class="input">
					<label for="email" class="email">이메일:</label>
					<input type="text" id="email" name="email">
				</div>
				<div class="input">
					<label for="password" class="password">비밀번호:</label>
					<input type="password" id="password" name="password">
				</div>
				<div class="input">
					<label for="nickname" class="nickname">닉네임:</label>
					<input type="text" id="nickname" name="nickname">
				</div>
				<div class="input">
					<label for="department" class="department">학과:</label>
					<input type="text" id="organization" name="organization">
				</div>
				<div class="join-button-group">
					<div class="a">
						<input type="submit" class="button btn btn-light btn-outline-dark" value="회원가입"/>
						<a type="button" class="button btn btn-light btn-outline-dark">취소</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>