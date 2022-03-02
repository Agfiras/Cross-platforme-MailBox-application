import "./newUser.css";
import { useForm } from "react-hook-form";
export default function NewUser() {
  const { register, handleSubmit } = useForm({ shouldUseNativeValidation: true });
  const onSubmit = async data => { console.log(data); };
  return (
    <div className="newUser">
    <h1 className="newUserTitle">New User</h1>
      <form onSubmit={handleSubmit(onSubmit)} className="newUserForm">
      
        <div className="newUserItem">
          <label>Username</label>
          <input type="text" placeholder="Username" />
        </div>
        <div className="newUserItem">
          <label>Full Name</label>
          <input
        {...register("FullName", { required: "Please enter your full name." })} // custom message
      />
        </div>
        <div className="newUserItem">
          <label>Email</label>
          <input type="email" placeholder="Email Address" />
        </div>
        <div className="newUserItem">
          <label>Password</label>
          <input type="password" placeholder="password" />
        </div>
        <div className="newUserItem">
          <label>Phone Number</label>
          <input type="tel" {...register("Phone number")} />
        </div>
        <div className="newUserItem">
          <label>Address</label>
          <input type="text" placeholder="Address | Tunisia" />
        </div>
        <div className="newUserItem">
          <label>Gender</label>
          <div className="newUserGender">
            <input type="radio" name="gender" id="male" value="male" />
            <label for="male">Male</label>
            <input type="radio" name="gender" id="female" value="female" />
            <label for="female">Female</label>
            <input type="radio" name="gender" id="other" value="other" />
            <label for="other">Other</label>
          </div>
        </div>
        <div className="newUserItem">
          <label>Active</label>
          <select className="newUserSelect" name="active" id="active">
            <option value="yes">Yes</option>
            <option value="no">No</option>
          </select>
        </div>
        <input type="submit" value="Submit" className="submit"/>
      </form>
      
    </div>
  );
}