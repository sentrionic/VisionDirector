import {
  Box,
  Button,
  Flex,
  IconButton,
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
  Text,
  Tfoot,
  Th,
  Thead,
  Tr,
  useDisclosure,
  useToast,
} from "@chakra-ui/react";
import { Form, Formik } from "formik";
import React, { useState } from "react";
import { DashboardWrapper } from "../../components/common/DashboardWrapper";
import { InputField } from "../../components/common/InputField";
import {
  createTemplate,
  deleteTemplate,
  getTemplates,
} from "../../lib/api/axios";
import { Template } from "../../lib/api/dto/TemplateResponse";
import { TemplateSchema } from "../../lib/validation/template.schema";
import { AiOutlineDelete } from "react-icons/ai";
import { useQuery, useQueryClient } from "@tanstack/react-query";

const TableInfo: React.FC = () => {
  return (
    <Tr>
      <Th>ID</Th>
      <Th>Name</Th>
      <Th>Description</Th>
      <Th># Steps</Th>
      <Th>Belongs to</Th>
      <Th>Action</Th>
    </Tr>
  );
};

export const TemplatesPage = (): JSX.Element => {
  const key = "tKey";

  const { data } = useQuery([key], async () => {
    const response = await getTemplates();
    return response.data;
  });

  const { isOpen, onOpen, onClose } = useDisclosure();
  const toast = useToast();
  const cache = useQueryClient();
  const [showError, setShowError] = useState(false);

  return (
    <DashboardWrapper>
      <Flex justify={"flex-end"} mb="2">
        <Button variant={"outline"} colorScheme={"blue"} onClick={onOpen}>
          Add Template
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
              {data!.map((t) => (
                <TemplateTableItem template={t} key={t.id}></TemplateTableItem>
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
          validationSchema={TemplateSchema}
          initialValues={{
            name: "",
            description: "",
            projectId: "",
          }}
          onSubmit={async (values) => {
            try {
              const { data: newTemplate } = await createTemplate(values);
              cache.setQueryData<Template[]>([key], (data) => [
                ...data!,
                newTemplate,
              ]);
              toast({
                title: "Template created.",
                status: "success",
                duration: 5000,
                isClosable: true,
              });
              onClose();
            } catch (err: any) {
              console.log(err);
              setShowError(true);
            }
          }}
        >
          {({ isSubmitting }) => (
            <Form>
              <ModalContent>
                <ModalHeader>Create Template</ModalHeader>
                <ModalCloseButton />

                <ModalBody pb={6}>
                  <InputField label="Name (Must be unique)" name="name" />
                  <InputField
                    label="Description"
                    name="description"
                    textarea={true}
                  />
                  <InputField label="Project ID (optional)" name="projectId" />
                  <Text mt="2">
                    If the ID is null it will be a default global template
                  </Text>

                  <Text mt="4">Steps will be defined later.</Text>

                  {showError && (
                    <Text my="2" color="red" align="center">
                      Server Error. Please try again later.
                    </Text>
                  )}
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

const TemplateTableItem: React.FC<{ template: Template }> = ({ template }) => {
  const { isOpen, onOpen, onClose } = useDisclosure();
  const [showError, toggleShow] = useState(false);
  const cache = useQueryClient();

  const handleDelete = async (): Promise<void> => {
    try {
      const { data } = await deleteTemplate(template.id);
      if (data) {
        cache.setQueryData<Template[]>(["tKey"], (data) =>
          data!.filter((e) => e.id !== template.id)
        );
        onClose();
      }
    } catch (err) {
      toggleShow(true);
    }
  };

  return (
    <>
      <Tr _hover={{ bg: "borderGray" }}>
        <Td>{template.id}</Td>
        <Td>
          <Link
            fontWeight="semibold"
            href={`/dashboard/templates/${template.id}`}
            _focus={{ outline: "none" }}
          >
            {template.name}
          </Link>
        </Td>
        <Td>{template.description}</Td>
        <Td>{template.steps.length}</Td>
        <Td>{template.projectId ?? "Global"}</Td>
        <Td>
          {template.projectId && (
            <IconButton
              aria-label="Invite"
              icon={<AiOutlineDelete />}
              onClick={onOpen}
              colorScheme="red"
            />
          )}
        </Td>
      </Tr>
      <Modal isOpen={isOpen} onClose={onClose}>
        <ModalOverlay />
        <ModalContent>
          <ModalHeader>Delete '{template.name}'</ModalHeader>
          <ModalCloseButton />
          <ModalBody>
            <Text mb="2">
              Are you sure you want to delete this template? This cannot be
              undone.
            </Text>
            {showError && (
              <Text my="2" color="red" align="center">
                Server Error. Please try again later.
              </Text>
            )}
          </ModalBody>

          <ModalFooter>
            <Button variant="outline" mr={3} onClick={onClose}>
              Close
            </Button>
            <Button colorScheme="red" onClick={() => handleDelete()}>
              Delete
            </Button>
          </ModalFooter>
        </ModalContent>
      </Modal>
    </>
  );
};
