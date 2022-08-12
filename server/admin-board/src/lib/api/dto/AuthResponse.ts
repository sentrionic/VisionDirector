import { User } from "./UserResponse";

export interface AuthResponse {
  token: string;
  user: User;
}
