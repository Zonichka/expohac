import { isDate, IsEmail, IsPhoneNumber, Length } from "class-validator";
import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";


@Entity()
export class User{
    @PrimaryGeneratedColumn("uuid")
    id: number

    @Column({unique: true})
    @Length(6, 15, {
        message: "Длина логина должна быть от 6 до 15 символов"
    })
    login: string

    @Column()
    @Length(2, 15, {
        message: "Длина имени должна быть от 2 до 15 символов"
    })
    name: string

    @Column()
    @Length(2, 15, {
        message: "Длина фамилии должна быть от 2 до 15 символов"
    })
    lastName: string

    @Column({nullable: true})
    sex: string

    @Column({nullable: true})
    birthday: string

    @Column({nullable: true})
    @IsPhoneNumber("RU",{
        message: "Некорректный телефон"
    })
    phone: string

    @Column({nullable: true})
    @IsEmail({}, {
        message: "Некорректная почта"
    })
    email: string

    @Column()
    @Length(6, 15, {
        message: "Длина пароля должна быть от 6 до 15"
    })
    passwordHash: string

    @Column("text", {nullable: true})
    avatar: string | null
}