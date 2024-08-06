import { makeAutoObservable } from "mobx";
import { IUser } from "../shared/types/UserTypes";

export const DefaultUser = {
    id: "",
    login: "",
    name: "",
    lastName: "",
    email: "",
    phone: "",
    sex: "",
    birthday: "",
    avatar: "",
    avatarURL: ""
}

class UserStore{
    user: IUser = DefaultUser
    constructor(){
        makeAutoObservable(this)
    }
    setUser(user: IUser){
        this.user = user
    }

}

const userStore = new UserStore()

export default userStore