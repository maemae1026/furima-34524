const pay = () => {
  Payjp.setPublicKey("pk_test_48b765260b30f914f80296fe"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("buyer_residence[number]"),
      cvc: formData.get("buyer_residence[cvc]"),
      exp_month: formData.get("buyer_residence[exp_month]"),
      exp_year: `20${formData.get("buyer_residence[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("buyer_residence_number").removeAttribute("name");
      document.getElementById("buyer_residence_cvc").removeAttribute("name");
      document.getElementById("buyer_residence_exp_month").removeAttribute("name");
      document.getElementById("buyer_residence_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);