import { Navigate } from "react-router-dom";
import { userStore } from "../lib/userStore";

export const AuthRoute = ({ children }: { children: JSX.Element }) => {
  const isAuthenticated = window.sessionStorage.getItem("jwt")!;
  const role = userStore((state) => state.role);

  if (!isAuthenticated) {
    return <Navigate to="/" />;
  }

  if (role !== "Admin" && role !== "Moderator") {
    return <Navigate to="/forbidden" />;
  }

  return children;
};

export const AdminRoute = ({ children }: { children: JSX.Element }) => {
  const isAuthenticated = window.sessionStorage.getItem("jwt")!;
  const role = userStore((state) => state.role);

  if (!isAuthenticated) {
    return <Navigate to="/" />;
  }

  if (role !== "Admin") {
    return <Navigate to="/forbidden" />;
  }

  return children;
};
