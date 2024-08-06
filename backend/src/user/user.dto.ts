import { IsString, Length } from "class-validator"

export class CreateUserDto{
    @IsString()
    @Length(2, 15, {
        message: "Длина логина должна быть от 2 до 15"
    })
    login: string

    @IsString()
    @Length(2, 15, {
        message: "Длина имени должна быть от 2 до 15"
    })
    name: string

    @IsString()
    @Length(2, 15, {
        message: "Длина фамилии должна быть от 2 до 15"
    })
    lastName: string

    @IsString()
    @Length(6, 15, {
        message: "Длина пароля должна быть от 6 до 15"
    })
    password: string
}

export class LoginUserDto{
    @IsString()
    @Length(2, 15, {
        message: "Длина логина должна быть от 2 до 15"
    })
    login: string

    @IsString()
    @Length(6, 15, {
        message: "Длина пароля должна быть от 6 до 15"
    })
    password: string
}

// export class UpdateUserDto{
//     @IsString()
//     @Length(2, 15, {
//         message: "Длина имени должна быть от 2 до 15"
//     })
// }