import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from './user.entity';
import { Repository } from 'typeorm';
import { CreateUserDto, LoginUserDto } from './user.dto';
import { Request } from 'express';

@Injectable()
export class UserService {
    constructor(
        private readonly jwtService: JwtService,
        @InjectRepository(User)
        private readonly userRepository: Repository<User>
    ){}

    async authUser(createUserDto: CreateUserDto){
        const user = new User()
        if (createUserDto.login.length <= 2) throw new HttpException("Длина логина должна быть от 2 до 15", HttpStatus.BAD_REQUEST)
        if (createUserDto.password.length <= 6) throw new HttpException("Длина пароля должна быть от 6 до 15", HttpStatus.BAD_REQUEST)
        if (createUserDto.name.length <= 2) throw new HttpException("Длина имени должна быть от 2 до 15", HttpStatus.BAD_REQUEST)
        if (createUserDto.lastName.length <= 2) throw new HttpException("Длина фамилии должна быть от 2 до 15", HttpStatus.BAD_REQUEST)
        user.login = createUserDto.login
        user.passwordHash = createUserDto.password
        user.name = createUserDto.name
        user.lastName = createUserDto.lastName
        try{
            const id = (await this.userRepository.save(user)).id
            const token = this.jwtService.sign({id: id}, {secret: "secret"})
            return JSON.stringify({
                jwt: token,
                status: "OK"
            })
        }
        catch(e){
            throw new HttpException("Не удалось зарегестировать пользователя", HttpStatus.BAD_REQUEST)
        }
        
    }

    async loginUser(loginUserDto: LoginUserDto){
        const user = await this.userRepository.findOneBy({login: loginUserDto.login})
        if (!user){
            throw new HttpException("Пользователь не найден", HttpStatus.NOT_FOUND)
        }
        
        if (!(loginUserDto.password == user.passwordHash)){
            throw new HttpException("Неверный пароль", HttpStatus.BAD_REQUEST)
        }
        const token = this.jwtService.sign({id: user.id}, {secret: "secret"})
        return JSON.stringify({
            jwt: token,
            status: "OK"
        })
    }

    async getUser(req: Request){
        return await this.userRepository.findOneBy({id: req["id"]})
    }

    async updateUser(){

    }
}
