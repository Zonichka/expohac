import { Title } from '../../shared/ui';
import styles from './ProfilePage.module.scss'

const ProfilePage = () => {
    return (
        <>
        <div className={styles.ProfilePage}>
            <Title
                content='Личный кабинет'
            />
            <div className={styles.Page}>

            </div>
        </div>
        </>
    );
}
 
export default ProfilePage;