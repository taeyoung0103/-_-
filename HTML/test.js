function check(form)
{
    if(form.userid.value=="guest" && form.userpassword.value=="1234")
    {
        window.open('guest.html')
    }
    else if(form.userid.value=="admin"&&form.userpassword.value=="9876")
    {
        window.open('admin.html')
    }
    else
    {
        alert("Error ID or Password");
    }
}