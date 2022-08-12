import { Box } from "@chakra-ui/react";
import { SidebarContent } from "../dashboard/SidebarContent";

interface IProps {
  children: React.ReactNode;
}

export const DashboardWrapper: React.FC<IProps> = ({ children }) => {
  return (
    <Box minH="100vh" bg={"gray.100"}>
      <SidebarContent />
      <Box ml={60} p="4" px="8">
        {children}
      </Box>
    </Box>
  );
};
