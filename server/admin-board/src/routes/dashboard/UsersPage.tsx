import {
  Box,
  Button,
  Flex,
  FormLabel,
  Modal,
  ModalBody,
  ModalCloseButton,
  ModalContent,
  ModalFooter,
  ModalHeader,
  ModalOverlay,
  Radio,
  RadioGroup,
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
import React from "react";
import { createAccount, getUsers } from "../../lib/api/axios";
import { User } from "../../lib/api/dto/UserResponse";
import { RegisterSchema } from "../../lib/validation/account.schema";
import { DashboardWrapper } from "../../components/common/DashboardWrapper";
import { UserTableItem } from "../../components/users/UserTableItem";
import { InputField } from "../../components/common/InputField";
import { useQuery, useQueryClient } from "@tanstack/react-query";

const TableInfo: React.FC = () => {
  return (
    <Tr>
      <Th>ID</Th>
      <Th>Email</Th>
      <Th>Name</Th>
      <Th>Role</Th>
    </Tr>
  );
};

export const UsersPage = (): JSX.Element => {
  const key = "uKey";

  const { data } = useQuery([key], async () => {
    const response = await getUsers();
    return response.data;
  });

  const { isOpen, onOpen, onClose } = useDisclosure();
  const [value, setValue] = React.useState("Stakeholder");
  const toast = useToast();
  const cache = useQueryClient();

  return (
    <DashboardWrapper>
      <Flex justify={"flex-end"} mb="2">
        <Button variant={"outline"} colorScheme={"blue"} onClick={onOpen}>
          Create User
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
              {data!.map((u) => (
                <UserTableItem user={u} key={u.id}></UserTableItem>
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
          validationSchema={RegisterSchema}
          initialValues={{
            email: "",
            username: "",
            password: "",
          }}
          onSubmit={async (values, { setErrors, resetForm }) => {
            try {
              const { data: account } = await createAccount({
                ...values,
                role: value,
              });
              cache.setQueryData<User[]>([key], (data) => [
                ...(data ?? []),
                {
                  username: values.username,
                  email: values.email,
                  id: account.user.id,
                  role: value,
                },
              ]);
              toast({
                title: "Project created.",
                status: "success",
                duration: 5000,
                isClosable: true,
              });

              resetForm();
            } catch (err: any) {
              if (err?.response?.status === 401) {
                setErrors({ password: "Invalid Credentials" });
              }
            }
          }}
        >
          {({ isSubmitting }) => (
            <Form>
              <ModalContent>
                <ModalHeader>Create Account</ModalHeader>
                <ModalCloseButton />

                <ModalBody pb={6}>
                  <InputField
                    label="Email"
                    name="email"
                    autoComplete="email"
                    type="email"
                  />

                  <InputField label="Username" name="username" />

                  <InputField
                    label="Password"
                    name="password"
                    autoComplete="password"
                    type="password"
                  />

                  <RadioGroup mt="4" onChange={setValue} value={value}>
                    <Flex align={"center"} justify={"space-between"}>
                      <FormLabel size="sm">Role:</FormLabel>
                      <Radio value="User">User</Radio>
                      <Radio value="Moderator">Moderator</Radio>
                    </Flex>
                  </RadioGroup>
                </ModalBody>

                <ModalFooter>
                  <Button
                    colorScheme="blue"
                    mr={3}
                    type="submit"
                    isLoading={isSubmitting}
                  >
                    Create
                  </Button>
                  <Button onClick={onClose}>Close</Button>
                </ModalFooter>
              </ModalContent>
            </Form>
          )}
        </Formik>
      </Modal>
    </DashboardWrapper>
  );
};
