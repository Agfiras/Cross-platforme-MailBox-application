import "./user.css";
import {
  CalendarToday,
  LocationSearching,
  MailOutline,
  PermIdentity,
  PhoneAndroid,
  Publish,
} from "@mui/icons-material";
import { Link } from "react-router-dom";


export default function User() {
  return (



    <div className="user">
         <div className="userTitleContainer">
         <h1 className="userTitle">Edit user</h1>
         <Link to="/newUser">
        </Link>
          </div>
    <div className="userContainer">
      <div className="userDisplay">
        <div className="userDisplayTop">
          <img src="" alt="" className="userDisplayImg" />
          <div className="userDisplayTopTitle">
            <span className="userDisplayUsername">Username</span>
            <span className="userDisplayUserTitle">Software Engineer</span>
          </div>
          </div>
        <div className="userDisplayBottom">
        <span className="userDisplayTitle">Account Details</span>

        <div className="userDisplayInfo">
              <PermIdentity className="userDisplayIcon" />
              <span className="userDisplayInfoTitle">Full name</span>
            </div>
            <div className="userDisplayInfo">
              <CalendarToday className="userDisplayIcon" />
              <span className="userDisplayInfoTitle">../../..</span>
            </div>
            <span className="userDisplayTitle">Contact Details</span>
            <div className="userDisplayInfo">
              <PhoneAndroid className="userDisplayIcon" />
              <span className="userDisplayInfoTitle">+216 .. ... ...</span>
            </div>
            <div className="userDisplayInfo">
              <MailOutline className="userDisplayIcon" />
              <span className="userDisplayInfoTitle">Email Address</span>
            </div>
            <div className="userDisplayInfo">
              <LocationSearching className="userDisplayIcon" />
              <span className="userDisplayInfoTitle"> Address | Tunisia</span>
            </div>
          </div>
        </div>
        <div className="userUpdate">
          <span className="userUpdateTitle">Edit</span>
          <form className="userUpdateForm">
            <div className="userUpdateLeft">
              <div className="userUpdateItem">
                <label>Username</label>
                <input
                  type="text"
                  placeholder="Hanin"
                  className="userUpdateInput"
                />
              </div>
              <div className="userUpdateItem">
                <label>Full Name</label>
                <input
                  type="text"
                  placeholder="Full Name"
                  className="userUpdateInput"
                />
              </div>
              <div className="userUpdateItem">
                <label>Email</label>
                <input
                  type="text"
                  placeholder="Email Address"
                  className="userUpdateInput"
                />
              </div>
              <div className="userUpdateItem">
                <label>Phone</label>
                <input
                  type="text"
                  placeholder="+216 .. ... ... "
                  className="userUpdateInput"
                />
              </div>
              <div className="userUpdateItem">
                <label>Address</label>
                <input
                  type="text"
                  placeholder=" | Tunisia"
                  className="userUpdateInput"
                />
              </div>
            </div>
            <div className="userUpdateRight">
              <div className="userUpdateUpload">
                <img
                  className="userUpdateImg"
                  src=""
                  alt=""
                />
                <label htmlFor="file">
                  <Publish className="userUpdateIcon" />
                </label>
                <input type="file" id="file" style={{ display: "none" }} />
              </div>
              <button className="userUpdateButton">Update</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    
  );
}

