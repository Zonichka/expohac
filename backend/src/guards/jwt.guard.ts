import { CanActivate, ExecutionContext, HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { JwtService } from "@nestjs/jwt";

@Injectable()
export class JwtGuard implements CanActivate{
  constructor(private readonly jwtService: JwtService){}

  async canActivate(context: ExecutionContext) {
    const req = context.switchToHttp().getRequest()
    const token = req.headers.authorization
    if (!token){
      throw new HttpException("Не удалось авторизовать пользователя", HttpStatus.BAD_REQUEST)
    }
    try{
      const jwt = await this.jwtService.verify(token.split(" ")[1], {secret: "secret"})
      const id = jwt.id
      req["id"] = id
      return true
    }
    catch(e){
      throw new HttpException("Неверный токен", HttpStatus.FORBIDDEN)
    }
  }
}