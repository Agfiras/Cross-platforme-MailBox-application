import "./mailboxList.css";
import { DataGrid } from "@mui/x-data-grid";
import { DeleteOutline } from "@mui/icons-material";
import { mailboxRows } from "../../dummyData";
import { Link } from "react-router-dom";
import { useState } from "react";

export default function MailBoxList() {
  const [data, setData] = useState(mailboxRows); /*setData is a function to use t change value */
  const handleDelete = (id) => {
    setData(data.filter((item) => item.id !== id));
  };

  const columns = [
    { field: "id", headerName: "ID", width: 90 },
    {
      field: "mailBox",
      headerName: "MailBox",
      width: 200,
      renderCell: (params) => {
        return (
          <div className="mailBoxListItem">
            <img className="mailBoxListImg" src={params.row.img} alt="" />
            {params.row.name}
          </div>
        );
      },
    },
    { field: "stock", headerName: "Stock", width: 200 },
    {
      field: "status",
      headerName: "Status",
      width: 120,
    },
    {
      field: "price",
      headerName: "Price",
      width: 160,
    },
    {
      field: "action",
      headerName: "Action",
      width: 150,
      renderCell: (params) => {
        return (
          <>
            <Link to={"/UpdateMailbox/"+ params.row.id}>
              <button className="mailBoxListEdit">Edit</button>
            </Link>
            <DeleteOutline
              className="mailBoxListDelete"
              onClick={() => handleDelete(params.row.id)}
            />
          </>
          
        );
      },
    },
  ];

  return (
    <div className="mailBoxList">
      <DataGrid
        rows={data}
        disableSelectionOnClick
        columns={columns}
        pageSize={10}
        checkboxSelection
      />
      <div className="mailboxAddButton">
      <Link to="/NewMailBox">
          <button className="mailboxAddButton">Create SmartBox</button>
        </Link>
        </div>
    </div>
  );
}