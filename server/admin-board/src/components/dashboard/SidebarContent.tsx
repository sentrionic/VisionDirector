import { Box, Flex, FlexProps, Icon, Link, Text } from "@chakra-ui/react";
import { ReactText } from "react";
import { IconType } from "react-icons";
import { FiHome, FiLayers, FiUsers, FiFileText } from "react-icons/fi";
import { useLocation } from "react-router-dom";
import { userStore } from "../../lib/userStore";

interface LinkItemProps {
  name: string;
  icon: IconType;
  link: string;
  access: string[];
}

const LinkItems: Array<LinkItemProps> = [
  {
    name: "Home",
    icon: FiHome,
    link: "/dashboard",
    access: ["Admin", "Moderator"],
  },
  {
    name: "Templates",
    icon: FiFileText,
    link: "/dashboard/templates",
    access: ["Admin", "Moderator"],
  },
  { name: "Users", icon: FiUsers, link: "/dashboard/users", access: ["Admin"] },
  {
    name: "Projects",
    icon: FiLayers,
    link: "/dashboard/projects",
    access: ["Admin"],
  },
];

interface NavItemProps extends FlexProps {
  icon: IconType;
  link: string;
  isActive: boolean;
  children: ReactText;
}

const NavItem = ({ icon, link, children, isActive, ...rest }: NavItemProps) => {
  const flexColor = isActive ? "blue.400" : undefined;
  const textColor = isActive ? "white" : undefined;

  return (
    <Link
      href={link}
      style={{ textDecoration: "none" }}
      _focus={{ outline: "none" }}
    >
      <Flex
        align="center"
        p="4"
        mx="4"
        my="1"
        borderRadius="lg"
        role="group"
        cursor="pointer"
        _hover={{
          bg: "blue.300",
          color: "white",
        }}
        bg={flexColor}
        color={flexColor}
        {...rest}
      >
        {icon && (
          <Icon
            mr="4"
            fontSize="16"
            _groupHover={{
              color: "white",
            }}
            color={textColor}
            as={icon}
          />
        )}
        <Text color={textColor}>{children}</Text>
      </Flex>
    </Link>
  );
};

export const SidebarContent: React.FC = () => {
  const { pathname } = useLocation();
  const role = userStore((state) => state.role);

  return (
    <Box
      bg={"white"}
      borderRight="1px"
      borderRightColor={"gray.200"}
      w={60}
      pos="fixed"
      h="full"
      display={"block"}
    >
      <Flex h="20" alignItems="center" mx="8" justifyContent="space-between">
        <Text fontSize="2xl" fontFamily="monospace" fontWeight="bold">
          Admin Board
        </Text>
      </Flex>
      {LinkItems.map((link) =>
        link.access.includes(role) ? (
          <NavItem
            key={link.name}
            link={link.link}
            icon={link.icon}
            isActive={pathname.endsWith(link.link)}
          >
            {link.name}
          </NavItem>
        ) : null
      )}
    </Box>
  );
};
