document.querySelector("form").addEventListener("submit", function(event) {
  var idInput = document.querySelector(".idbox");
  var pwInput = document.querySelector(".pwbox");
  var pw2Input = document.querySelector(".pwbox2");
  var nameInput = document.querySelector(".namebox");
  var phoneInput = document.querySelector(".phonebox");
  var emptyInputs = [];

  if (idInput.value === "") {
    emptyInputs.push(idInput);
  }

  if (pwInput.value === "") {
    emptyInputs.push(pwInput);
  }

  if (pw2Input.value === "") {
    emptyInputs.push(pw2Input);
  }

  if (nameInput.value === "") {
    emptyInputs.push(nameInput);
  }

  if (phoneInput.value === "") {
    emptyInputs.push(phoneInput);
  }

  if (emptyInputs.length > 0) {
    event.preventDefault(); // 폼 제출 이벤트를 취소하여 서버로의 전송을 막습니다.
    emptyInputs[0].focus(); // 입력하지 않은 상자 중 첫 번째 상자에 포커스를 설정합니다.
    alert("입력하지 않은 정보가 있습니다.");
  } else if (pwInput.value !== pw2Input.value) {
    event.preventDefault(); // 폼 제출 이벤트를 취소하여 서버로의 전송을 막습니다.
    pwInput.focus(); // 비밀번호 입력 상자에 포커스를 설정합니다.
    alert("비밀번호가 일치하지 않습니다.");
  }
});
