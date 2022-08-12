import create from "zustand";
import { persist } from "zustand/middleware";
import { AuthResponse } from "./api/dto/AuthResponse";

type User = {
  id: string;
  username: string;
  role: string;
  setValues: (input: AuthResponse) => void;
};

export const userStore = create(
  persist<User>(
    (set) => ({
      id: "",
      username: "",
      role: "",
      setValues: (input) =>
        set({
          id: input.user.id,
          role: input.user.role,
          username: input.user.username,
        }),
    }),
    {
      name: "user-storage",
      getStorage: () => sessionStorage,
    }
  )
);
