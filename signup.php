<!DOCTYPE html>
<html>

</html>


<?php

/*
 * Following code will get single product details
 * A product is identified by product id (pid)
 */
$response = array();
if (isset($_POST['name']) && isset($_POST['email'])&& isset($_POST['password']) && isset($_POST['phone'])&& isset($_POST['graduateYear'])&& isset($_POST['faculty'])&& isset($_POST['degree'])) {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $password = $_POST['password'];
    $graduateYear = $_POST['graduateYear'];
    $faculty = $_POST['faculty'];;
    $degree = $_POST['degree'];;
    // include db connect class
    require_once __DIR__ . '/db_connect.php';
    try{
        // connecting to db
        $con = new DB_CONNECT();
        $db = $con->connect();
        // mysql inserting a new row
        $checkEmail = $db->prepare("SELECT email FROM serviceMembers WHERE email = :email");

        // binding parameters for mysql insertion
        $checkEmail->bindParam(":email", $email);
        // mysql inserting a new row with prepared and binded statements
        $checkEmail->execute();

        // check if row inserted or not
        if ($checkEmail) {
            // check for empty result
            if ($checkEmail->rowCount() > 0) {
                $checkEmail = $checkEmail->fetch();
                $response["success"] = -1;
                $response["message"] = "This email has already been created, please enter another valid email";
                echo json_encode($response);
            }
            else {
                // failed to insert row
                $checkUsername = $db->prepare("SELECT name FROM serviceMembers WHERE name = :name");
                $checkUsername->bindParam(":name", $name);   
                $checkUsername->execute();

                if($checkUsername){
                    if($checkUsername->rowCount()>0){
                        $checkUsername = $checkUsername->fetch();
                        $response["success"] = -1;
                        $response["message"] = "This user name has already been created, please enter another valid user name";
                        echo json_encode($response);
                        }
                        else{

                            $result = $db->prepare("INSERT INTO serviceMembers(email, phone_number, year, faculty, degreeType, name, password) VALUES(:email, :phone, :graduateYear, :faculty, :degree, :name, :password)");
                            // binding parameters for mysql insertion
                            $result->bindParam(":email", $email);
                            $result->bindParam(":phone", $phone);
                            $result->bindParam(":graduateYear", $graduateYear);
                            $result->bindParam(":faculty", $faculty);
                            $result->bindParam(":degree", $degree);
                            $result->bindParam(":name", $name);
                            $result->bindParam(":password", $password);
                            // mysql inserting a new row with prepared and binded statements
                            $result->execute();

                            // check if row inserted or not
                            if ($result) {
                                if ($result->rowCount() > 0) {
                                    $response["success"] = 1;
                                    $response["message"] = "You are now registered.";
                                    echo json_encode($response);
                                    // successfully inserted into database
                                    // header('Location: http://percyteng.com/queensbnb/log_in.html');    
                                }
                                else{
                                    // failed to insert row
                                    $response["success"] = 0;
                                    $response["message"] = "Oops! An error occurred.";
                                    echo json_encode($response);
                                }
                            } else {
                                // failed to insert row
                                $response["success"] = 0;
                                $response["message"] = "Oops! An error occurred.";
                                echo json_encode($response);
                                }
                                // echoing JSON response

                        }
                    }
                else {
                    // failed to insert row
                    $response["success"] = 0;
                    $response["message"] = "Oops! An error occurred.";
                    
                    // echoing JSON response
                    echo json_encode($response);
                }   
            }
        }
        else {
            // failed to insert row
            $response["success"] = 0;
            $response["message"] = "Oops! An error occurred.";
            
            // echoing JSON response
            echo json_encode($response);
        }   
    } catch (PDOException $e){
        $response["success"] = 0;
        $response["message"] = "Oops! An error occurred.";
            
            // echoing JSON response
        echo json_encode($response);
        print "Sorry, a database error occurred. Please try again later.\n";
        print $e->getMessage();
    }
} else {
    // required field is missing
    $response["success"] = 0;
    $response["message"] = "Something is missing for database.";
    // echoing JSON response
    echo json_encode($response);
}
?>