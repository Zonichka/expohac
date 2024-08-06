import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './user.entity';
import { NestjsFormDataModule } from 'nestjs-form-data';
import { JwtService } from '@nestjs/jwt';
import { Repository } from 'typeorm';

@Module({
  imports: [
    NestjsFormDataModule,
    TypeOrmModule.forFeature([User])
  ],
  controllers: [UserController],
  providers: [
    UserService,
    JwtService,
    Repository
  ],
})
export class UserModule {}
