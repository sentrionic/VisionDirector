import {
  Box,
  Button,
  Flex,
  Heading,
  Link,
  Modal,
  ModalBody,
  ModalCloseButton,
  ModalContent,
  ModalFooter,
  ModalHeader,
  ModalOverlay,
  Table,
  Tbody,
  Td,
  Tfoot,
  Th,
  Thead,
  Tr,
  useDisclosure,
  useToast,
} from "@chakra-ui/react";
import { useQuery } from "@tanstack/react-query";
import { CUIAutoComplete } from "chakra-ui-autocomplete";
import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { DashboardWrapper } from "../../../components/common/DashboardWrapper";
import { addMembers, getProject, getScenarios } from "../../../lib/api/axios";
import { Project } from "../../../lib/api/dto/ProjectResponse";
import { formatDate } from "../../../lib/utils/dateUtils";

const MemberTableInfo: React.FC = () => {
  return (
    <Tr>
      <Th>ID</Th>
      <Th>Email</Th>
      <Th>Username</Th>
    </Tr>
  );
};

const ScenarioTableInfo: React.FC = () => {
  return (
    <Tr>
      <Th>ID</Th>
      <Th>Name</Th>
      <Th>Creation</Th>
      <Th>Last Updated</Th>
      <Th>Steps</Th>
      <Th>Duration (s)</Th>
      <Th>URL</Th>
    </Tr>
  );
};

interface Item {
  label: string;
  value: string;
}

export const ProjectDetail = (): JSX.Element => {
  const { id } = useParams();
  const [project, setProject] = useState<Project>();
  const [selectedItems, setSelectedItems] = useState<Item[]>([]);
  const { isOpen, onOpen, onClose } = useDisclosure();
  const toast = useToast();

  const { data } = useQuery(["sKey"], async () => {
    const response = await getScenarios(id!);
    return response.data;
  });

  useEffect(() => {
    const fetch = async () => {
      const { data } = await getProject(id!);
      setProject(data);
    };
    fetch();
  }, [id]);

  const handleCreateItem = (item: Item) => {
    setSelectedItems((curr) => [...curr, item]);
  };

  const handleSelectedItemsChange = (selectedItems?: Item[]) => {
    if (selectedItems) {
      setSelectedItems(selectedItems);
    }
  };

  const addMembersToProject = async () => {
    try {
      const ids = selectedItems.map((s) => s.value);
      await addMembers(id!, ids);
      toast({
        title: "Users added.",
        status: "success",
        duration: 5000,
        isClosable: true,
      });
    } catch (err) {
      console.log(err);
    }
  };

  if (project == null) return <Box />;

  return (
    <DashboardWrapper>
      <Flex
        border="1px"
        borderRadius="12px"
        p={4}
        borderColor="#e2e8f0"
        bg={"white"}
        w="lg"
        align={"center"}
        mb="4"
      >
        <Heading>Project: {project.name}</Heading>
      </Flex>
      <Flex px="2" w="100%" justify={"space-between"} mb="4">
        <Heading>Members</Heading>
        <Button variant={"outline"} colorScheme={"blue"} onClick={onOpen}>
          Add Member
        </Button>
      </Flex>
      <Box
        border="1px"
        borderRadius="12px"
        p={4}
        borderColor="#e2e8f0"
        bg={"white"}
      >
        <Table variant="simple">
          <Thead>
            <MemberTableInfo />
          </Thead>
          <Tbody>
            {project.collaborators!.map((p) => (
              <Tr _hover={{ bg: "borderGray" }} key={p.id}>
                <Td>{p.id}</Td>
                <Td>{p.email}</Td>
                <Td>{p.username}</Td>
              </Tr>
            ))}
          </Tbody>
          <Tfoot>
            <MemberTableInfo />
          </Tfoot>
        </Table>
      </Box>
      <Box h="40px" />
      <Heading ml="2" mb="4">
        Scenarios
      </Heading>
      <Box
        border="1px"
        borderRadius="12px"
        p={4}
        borderColor="#e2e8f0"
        bg={"white"}
      >
        <Table variant="simple">
          <Thead>
            <ScenarioTableInfo />
          </Thead>
          <Tbody>
            {data?.map((s) => (
              <Tr _hover={{ bg: "borderGray" }} key={s.id}>
                <Td>{s.id}</Td>
                <Td>
                  <Link
                    fontWeight="semibold"
                    href={`/dashboard/projects/${project.id}/${s.id}`}
                    _focus={{ outline: "none" }}
                  >
                    {s.name}
                  </Link>
                </Td>
                <Td>{formatDate(s.createdAt)}</Td>
                <Td>{formatDate(s.updatedAt)}</Td>
                <Td>{s.stepCount}</Td>
                <Td>{s.duration}</Td>
                <Td>
                  <Link onClick={() => window.open(s.url, "_blank")}>
                    {s.url}
                  </Link>
                </Td>
              </Tr>
            ))}
          </Tbody>
          <Tfoot>
            <ScenarioTableInfo />
          </Tfoot>
        </Table>
      </Box>
      <Modal isOpen={isOpen} onClose={onClose}>
        <ModalOverlay />
        <ModalContent>
          <ModalHeader>Add Members</ModalHeader>
          <ModalCloseButton />
          <ModalBody>
            <CUIAutoComplete
              label="Members"
              placeholder="Input ID"
              onCreateItem={handleCreateItem}
              items={[]}
              selectedItems={selectedItems}
              onSelectedItemsChange={(changes) =>
                handleSelectedItemsChange(changes.selectedItems)
              }
            />
          </ModalBody>

          <ModalFooter>
            <Button mr={3} onClick={onClose}>
              Close
            </Button>
            <Button colorScheme="blue" onClick={() => addMembersToProject()}>
              Save
            </Button>
          </ModalFooter>
        </ModalContent>
      </Modal>
    </DashboardWrapper>
  );
};
