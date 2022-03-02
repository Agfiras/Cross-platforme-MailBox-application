import Sidebar from "./components/sidebar/Sidebar";
import Topbar from "./components/topbar/Topbar";
import "./App.css";
import Home from "./pages/home/Home";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import UserList from "./pages/home/userList/UserList";
import User from "./pages/home/user/User";
import NewUser from "./pages/home/newUser/NewUser";
import MailboxList from "./pages/mailboxList/MailboxList";
import UpdateMailbox from "./pages/UpdateMailbox/UpdateMailbox";
import NewMailBox from "./pages/NewMailBox/NewMailBox";

function App() {
  return (
    <Router>
      <Topbar />
      <div className="container">
        <Sidebar/>
        <Switch>
          <Route exact path="/">
            <Home/>
          </Route>
          <Route path="/users">
            <UserList/>
          </Route>
          <Route path="/user/:userId">
            <User/>
          </Route>
          <Route path="/newUser">
            <NewUser/>
          </Route>
          <Route path="/mailbox">
            <MailboxList/>
          </Route>
          <Route path="/UpdateMailbox/:mailboxId">
            <UpdateMailbox/>
          </Route>
          <Route path="/newMailBox">
            <NewMailBox/>
          </Route>
       
        </Switch>
      </div>
    </Router>
  );
}

export default App;