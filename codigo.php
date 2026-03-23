<?php
// datos guardados
$name = $_POST['name'];
$email = $_POST['email'];
$service = $_POST['service'];
$comments = $_POST['comments'];

// construccion del mail
$to = 'succubusisland@gmail.com';
$email_subject = "New message: from the website";
$email_body = "You have received a new message
                \n Name: $name
                \n Email: $email
                \n Inquiry about the following service: $service
                \n Message or inquiry: \n $comments \n";
$headers = "From: $email";

// envia el mail
if(mail($to, $email_subject, $email_body, $headers)) {
    echo 'We will contact you soon!';
} else {
    echo 'Sorry, there was an error sending your message.';
}
?>
<br>
<button><a href="index.html"></a>Back</button>