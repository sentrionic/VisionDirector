import { Heading } from "@chakra-ui/react";
import { DashboardWrapper } from "../../components/common/DashboardWrapper";
import { userStore } from "../../lib/userStore";

export const HomePage = (): JSX.Element => {
  const { username, role } = userStore((state) => state);
  return (
    <DashboardWrapper>
      <Heading>Welcome Back, {username}.</Heading>
      <Heading mt="4" size={"lg"}>
        You are currently logged in as: {role}
      </Heading>
    </DashboardWrapper>
  );
};
