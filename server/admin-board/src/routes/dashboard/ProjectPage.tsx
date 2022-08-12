import {
  Box,
  Button,
  Flex,
  Modal,
  ModalBody,
  ModalCloseButton,
  ModalContent,
  ModalFooter,
  ModalHeader,
  ModalOverlay,
  Table,
  Tbody,
  Tfoot,
  Th,
  Thead,
  Tr,
  useDisclosure,
  useToast,
} from "@chakra-ui/react";
import { Form, Formik } from "formik";
import { createProject, getProjects } from "../../lib/api/axios";
import { Project } from "../../lib/api/dto/ProjectResponse";
import { ProjectSchema } from "../../lib/validation/project.schema";
import { InputField } from "../../components/common/InputField";
import { ProjectTableItem } from "../../components/projects/ProjectTableItem";
import { DashboardWrapper } from "../../components/common/DashboardWrapper";
import { useQuery, useQueryClient } from "@tanstack/react-query";

const TableInfo: React.FC = () => {
  return (
    <Tr>
      <Th>ID</Th>
      <Th>Name</Th>
      <Th>Creation Date</Th>
      <Th>Scenarios</Th>
      <Th>Invite</Th>
    </Tr>
  );
};

export const ProjectPage = (): JSX.Element => {
  const { data } = useQuery(
    ["pKey"],
    async () => {
      const response = await getProjects();
      return response.data;
    },
    {
      cacheTime: Infinity,
    }
  );

  const { isOpen, onOpen, onClose } = useDisclosure();
  const toast = useToast();
  const cache = useQueryClient();

  return (
    <DashboardWrapper>
      <Flex justify={"flex-end"} mb="2">
        <Button variant={"outline"} colorScheme={"blue"} onClick={onOpen}>
          Create Project
        </Button>
      </Flex>
      <Box
        border="1px"
        borderRadius="12px"
        p={4}
        borderColor="#e2e8f0"
        bg={"white"}
      >
        {data && (
          <Table variant="simple">
            <Thead>
              <TableInfo />
            </Thead>
            <Tbody>
              {data!.map((p) => (
                <ProjectTableItem project={p} key={p.id} />
              ))}
            </Tbody>
            <Tfoot>
              <TableInfo />
            </Tfoot>
          </Table>
        )}
      </Box>
      <Modal isOpen={isOpen} onClose={onClose}>
        <ModalOverlay />
        <Formik
          validationSchema={ProjectSchema}
          initialValues={{
            name: "",
          }}
          onSubmit={async (values) => {
            try {
              const { data: newProject } = await createProject(values.name);
              cache.setQueryData<Project[]>(["pKey"], (data) => [
                ...data!,
                newProject,
              ]);
              toast({
                title: "Project created.",
                status: "success",
                duration: 5000,
                isClosable: true,
              });
              onClose();
            } catch (err: any) {}
          }}
        >
          {({ isSubmitting }) => (
            <Form>
              <ModalContent>
                <ModalHeader>Create Project</ModalHeader>
                <ModalCloseButton />

                <ModalBody pb={6}>
                  <InputField label="Name" name="name" />
                </ModalBody>

                <ModalFooter>
                  <Button
                    colorScheme="blue"
                    mr={3}
                    type="submit"
                    isLoading={isSubmitting}
                  >
                    Save
                  </Button>
                  <Button onClick={onClose}>Cancel</Button>
                </ModalFooter>
              </ModalContent>
            </Form>
          )}
        </Formik>
      </Modal>
    </DashboardWrapper>
  );
};
