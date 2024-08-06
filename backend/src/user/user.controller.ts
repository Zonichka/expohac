import { Body, Controller, Get, Post, Req, UseGuards } from '@nestjs/common';
import { UserService } from './user.service';
import { FormDataRequest } from 'nestjs-form-data';
import { CreateUserDto, LoginUserDto } from './user.dto';
import { JwtGuard } from 'src/guards/jwt.guard';
import { Request } from 'express';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Post("/auth")
  @FormDataRequest()
  AuthUser(@Body() createUserDto: CreateUserDto){
    return this.userService.authUser(createUserDto)
  }

  @Post("/login")
  @FormDataRequest()
  LoginUser(@Body() loginUserDto: LoginUserDto){
    return this.userService.loginUser(loginUserDto)
  }

  @Get()
  @UseGuards(JwtGuard)
  GetUser(@Req() req: Request){
    return this.userService.getUser(req)
  }

}
