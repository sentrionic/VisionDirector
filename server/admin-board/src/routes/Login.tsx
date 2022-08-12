import { Flex, Box, Heading, Spacer } from "@chakra-ui/layout";
import { LoginForm } from "../components/LoginForm";

export const Login = (): JSX.Element => {
  return (
    <Flex bg={"gray.50"} minH="100vh" py="12" px={{ base: "4", lg: "8" }}>
      <Box maxW="md" m="auto">
        <Heading textAlign="center" size="xl" fontWeight="extrabold">
          Dashboard
        </Heading>
        <Spacer h="8" />
        <Box
          bg={"white"}
          py="8"
          px={{ base: "4", md: "10" }}
          shadow="base"
          rounded={{ sm: "lg" }}
        >
          <LoginForm />
        </Box>
      </Box>
    </Flex>
  );
};
