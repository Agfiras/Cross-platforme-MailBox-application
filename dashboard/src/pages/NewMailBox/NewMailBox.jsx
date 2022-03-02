import "./newMailBox.css";
import { useForm } from "react-hook-form";
export default function NewMailBox() {
  const { register, handleSubmit } = useForm({ shouldUseNativeValidation: true });
  const onSubmit = async data => { console.log(data); };
  return (
    <div className="newMailBox">
      <h1 className="addMailBoxTitle">New MailBox</h1>
      <form onSubmit={handleSubmit(onSubmit)} className="addMailBoxForm">
        <div className="addMailBoxItem">
          <label>Image</label>
          <input type="file" id="file" />
        </div>
        <div className="addMailBoxItem">
          <label>Name</label>
          <input
        {...register("Box Name", { required: "Please enter name of the box." })} // custom message
      />
      </div>
        <div className="addMailBoxItem">
          <label>Stock</label>
          <input type="text" placeholder="123" />
        </div>
        <div className="addMailBoxItem">
          <label>Active</label>
          <select name="active" id="active">
            <option value="yes">Yes</option>
            <option value="no">No</option>
          </select>
        </div>
        <input type="submit" value="Submit" className="submit"/>
      </form>
    </div>
  );
}
