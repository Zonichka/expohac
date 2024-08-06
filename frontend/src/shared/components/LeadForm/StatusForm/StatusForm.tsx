import { StaticInput } from '../../../ui';
import FormTitle from '../FormTitle/FormTitle';
import styles from './StatusForm.module.scss'

const StatusForm = () => {
    return (
        <>
        <div className={styles.StatusForm}>
            <FormTitle
                content="Статус лида"
            />
            <form>
                <StaticInput
                    editable={false}
                    startValue='П-О Хвоя'
                    label='Создал партнер'
                    name='creater'
                />
                <StaticInput
                    editable={false}
                    startValue='Экспобанк'
                    label='Обрабатывающий парнтер'
                    name='owner'
                />
                <StaticInput
                    editable={false}
                    startValue='Горячий 0.9'
                    label='Статус обработки'
                    name='status'
                />
            </form>
        </div>
        </>
    );
}
 
export default StatusForm;