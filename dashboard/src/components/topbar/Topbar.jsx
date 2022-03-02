import React from 'react'
import "./topbar.css"
import {NotificationsNone, Language, Settings} from '@mui/icons-material';

export default function Topbar() {
  return (
    <div className="topbar">
      <div className="topbarWrapper">
        <div className="topLeft">
             <span className='logo'>Tunisian Post</span>
             </div>
        <div className="topRight">
           <div className='topbarIconContainer'>
          <NotificationsNone/>
           <span className="topIconBadge">2</span>
           </div>
           <div className='topbarIconContainer'>
          <Language/>
           
           </div>
           <div className='topbarIconContainer'>
          <Settings/>
           </div>
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM5XcL1mW58l0hpMsvLwB7Rc5ueunrv4Zq0g&usqp=CAU" alt="" className='topAvatar'/>
           </div>    
      </div> 
       </div>
      
  )
  ;
}
