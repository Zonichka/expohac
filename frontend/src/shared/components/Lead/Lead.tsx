import { useState } from "react";
import { ILead } from "../../types/LeadTypes";
import styles from './Lead.module.scss'
import LeadForm from "../LeadForm/LeadForm";


const Lead = (props: ILead) => {
    const {title, content, price, time, borderColor} = props
    const [showForm, setShowForm] = useState(false)
    return (
        <>
        <div
            className={styles.Lead}
            style={{
                borderLeft: `5px ${borderColor ? borderColor : "white"} solid`
            }}
            onClick={() => setShowForm(true)}
        >
            <h6 className={styles.Lead_Title}>{title}</h6>
            <p className={styles.Lead_Price}>{price} руб</p>
            <p className={styles.Lead_Content}>{content}</p>
            <p className={styles.Lead_Time}>{time}</p>
        </div>
        {showForm && <LeadForm {...props} clickEvent={() => setShowForm(false)} />}
        </>
    );
}
 
export default Lead;