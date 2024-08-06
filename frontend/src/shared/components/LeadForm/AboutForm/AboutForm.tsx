import { StaticInput } from "../../../ui";
import FormTitle from "../FormTitle/FormTitle";
import styles from './AboutForm.module.scss'


const AboutForm = () => {
    return (
        <>
        <div className={styles.AboutForm}>
            <FormTitle
                content="О лиде"
            />
            <form>
                <StaticInput
                    label='Стоймость'
                    editable
                    name='price'
                    startValue='5500'
                />
                <StaticInput
                    label='Фамилия'
                    editable
                    name='lastName'
                    startValue='Петров'
                />
                <StaticInput
                    label='Имя'
                    editable
                    name='firstName'
                    startValue='Петор'
                />
                <StaticInput
                    label='Отчество'
                    editable
                    name='fatherName'
                    startValue='Петрович'
                />
                <StaticInput
                    label='Дата рождения'
                    editable
                    name='birthday'
                    startValue='1 января 2000 года'
                />
                <StaticInput
                    label='Телефон'
                    editable
                    name='phone'
                    startValue='8 (937) 123-45-67'
                />
                <StaticInput
                    label='Почта'
                    editable
                    name='email'
                    startValue='besthuhman@gmail.com'
                />
            </form>
        </div>
        
        </>
    );
}
 
export default AboutForm;