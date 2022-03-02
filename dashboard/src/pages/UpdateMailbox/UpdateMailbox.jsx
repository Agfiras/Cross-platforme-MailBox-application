import "./updateMailbox.css";
import Chart from "../../components/chart/Chart"
import {mailboxData} from "../../dummyData"
import { Publish } from "@mui/icons-material";

export default function UpdateMailbox() {
  return (
    <div className="mailbox">
      <div className="mailboxTitleContainer">
        <h1 className="mailboxTitle">Product</h1>
      </div>
      <div className="mailboxTop">
          <div className="mailboxTopLeft">
              <Chart data={mailboxData} dataKey="Sales" title="Sales Performance"/>
          </div>
          <div className="mailboxTopRight">
              <div className="mailboxInfoTop">
                  <img src="data:image/jpeg;base64,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" alt="" className="mailboxInfoImg" />
                  <span className="mailboxName">Smart MailBox</span>
              </div>
              <div className="mailboxInfoBottom">
                  <div className="mailboxInfoItem">
                      <span className="mailboxInfoKey">id:</span>
                      <span className="mailboxInfoValue">123</span>
                  </div>
                  <div className="mailboxInfoItem">
                      <span className="mailboxInfoKey">sales:</span>
                      <span className="mailboxInfoValue">5123</span>
                  </div>
                  <div className="mailboxInfoItem">
                      <span className="mailboxInfoKey">active:</span>
                      <span className="mailboxInfoValue">yes</span>
                  </div>
                  <div className="mailboxInfoItem">
                      <span className="mailboxInfoKey">in stock:</span>
                      <span className="mailboxInfoValue">no</span>
                  </div>
              </div>
          </div>
      </div>
      <div className="mailboxBottom">
          <form className="mailboxForm">
              <div className="mailboxFormLeft">
                  <label>MailBox Name</label>
                  <input type="text" placeholder="Smart MailBox" />
                  <label>In Stock</label>
                  <select name="inStock" id="idStock">
                      <option value="yes">Yes</option>
                      <option value="no">No</option>
                  </select>
                  <label>Active</label>
                  <select name="active" id="active">
                      <option value="yes">Yes</option>
                      <option value="no">No</option>
                  </select>
              </div>
              <div className="mailboxFormRight">
                  <div className="mailboxUpload">
                      <img src="data:image/jpeg;base64,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" alt="" className="mailboxUploadImg" />
                      <label for="file">
                          <Publish/>
                      </label>
                      <input type="file" id="file" style={{display:"none"}} />
                  </div>
                  <button className="mailboxButton">Update</button>
              </div>
          </form>
      </div>
    </div>
  );
}