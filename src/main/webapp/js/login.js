document.querySelector("form").addEventListener("submit", function(event) {
  var idInput = document.querySelector(".idbox");
  var pwInput = document.querySelector(".pwbox");

  if (idInput.value === "" || pwInput.value === "") {
    event.preventDefault(); // 폼 제출 이벤트를 취소하여 서버로의 전송을 막습니다.

    if (idInput.value === "") {
      idInput.focus(); // 아이디 입력 상자에 포커스를 설정합니다.
    } else {
      pwInput.focus(); // 비밀번호 입력 상자에 포커스를 설정합니다.
    }
    
    alert("아이디와 비밀번호를 모두 입력해주세요.");
  }
});
