import { observer } from "mobx-react-lite";
import styles from './User.module.scss'
import { Link } from "react-router-dom";
import { defaultAvatar, exit } from "../../../assets";
import userStore, { DefaultUser } from "../../../store/userStore";



const User = observer(() => {
    return (
        <>
        <div style={{
            display: "flex",
            alignItems: "center",
            gap: "10px"
        }}>
            <Link to="/profile" className={styles.User}>
                <img src={userStore.user.avatarURL ? userStore.user.avatarURL : defaultAvatar} className={styles.User_Avatar} alt="" />
                <div className={styles.User_Info}>
                    <p className={styles.User_Info_Login}>{userStore.user.name} {userStore.user.lastName}</p>
                    <p className={styles.User_Info_Email}>Менеджер</p>
                </div>
            </Link>
            <img
                className={styles.User_Exit}
                src={exit}
                onClick={() => {
                    userStore.setUser(DefaultUser)
                }}
                alt=""
            />
        </div>
        
        </>
    );
})
 
export default User;