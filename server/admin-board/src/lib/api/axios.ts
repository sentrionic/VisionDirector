import axios, { AxiosResponse } from "axios";
import { AuthResponse } from "./dto/AuthResponse";
import { GenericResponse } from "./dto/GenericResponse";
import { LoginDTO } from "./dto/LoginDTO";
import { Project } from "./dto/ProjectResponse";
import { RegisterDTO } from "./dto/RegisterDTO";
import { Scenario } from "./dto/ScenarioResponse";
import { Step } from "./dto/StepResponse";
import { Template, TemplateDto, TemplateStep } from "./dto/TemplateResponse";
import { User } from "./dto/UserResponse";

axios.defaults.baseURL = process.env.REACT_APP_API_URL;

axios.interceptors.request.use((config) => {
  const token = window.sessionStorage.getItem("jwt");
  if (token) config!.headers!["Authorization"] = `Bearer ${token}`;
  return config;
});

export const login = (body: LoginDTO): Promise<AxiosResponse<AuthResponse>> =>
  axios.post("/account/login", body);

export const createAccount = (
  body: RegisterDTO
): Promise<AxiosResponse<AuthResponse>> => axios.post("/account/create", body);

export const getProjects = (): Promise<AxiosResponse<Project[]>> =>
  axios.get("/admin/projects");

export const getProject = (id: string): Promise<AxiosResponse<Project>> =>
  axios.get(`/admin/projects/${id}`);

export const createProject = (name: string): Promise<AxiosResponse<Project>> =>
  axios.post("/projects", { name });

export const getUsers = (): Promise<AxiosResponse<User[]>> =>
  axios.get("/account/list");

export const getInvite = (
  id: string,
  date: string
): Promise<AxiosResponse<GenericResponse>> =>
  axios.post(`/projects/${id}/invite`, { date });

export const getScenarios = (id: string): Promise<AxiosResponse<Scenario[]>> =>
  axios.get(`/admin/projects/${id}/scenarios`);

export const getSteps = (id: string): Promise<AxiosResponse<Step[]>> =>
  axios.get(`/admin/scenarios/${id}/steps`);

export const addMembers = (
  projectId: string,
  ids: string[]
): Promise<AxiosResponse<void>> =>
  axios.post(`/projects/${projectId}/members`, { ids });

export const getTemplates = (): Promise<AxiosResponse<Template[]>> =>
  axios.get("/templates");

export const createTemplate = (
  input: TemplateDto
): Promise<AxiosResponse<Template>> => axios.post("/templates", input);

export const deleteTemplate = (id: string): Promise<AxiosResponse<Template>> =>
  axios.delete(`/templates/${id}`);

export const deleteTemplateStep = (
  templateId: string,
  id: string
): Promise<AxiosResponse<TemplateStep>> =>
  axios.delete(`/templates/${templateId}/${id}`);

export const editTemplate = (
  id: string,
  data: FormData
): Promise<AxiosResponse<Template>> => axios.put(`/templates/${id}`, data);
