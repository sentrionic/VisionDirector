import { BrowserRouter, Route, Routes } from "react-router-dom";
import { AdminRoute, AuthRoute } from "./AuthRoute";
import { HomePage } from "./dashboard/HomePage";
import { ProjectPage } from "./dashboard/ProjectPage";
import { UsersPage } from "./dashboard/UsersPage";
import { Forbidden } from "./Forbidden";
import { Login } from "./Login";
import { ProjectDetail } from "./dashboard/projects/ProjectDetail";
import { ScenarioDetail } from "./dashboard/projects/ScenarioDetail";
import { TemplatesPage } from "./dashboard/TemplatesPage";
import { TemplateDetail } from "./dashboard/templates/TemplateDetail";
import { TemplateEdit } from "./dashboard/templates/TemplateEdit";

export const Router: React.FC = () => (
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<Login />} />
      <Route path="/forbidden" element={<Forbidden />} />
      <Route
        path={"/dashboard"}
        element={
          <AuthRoute>
            <HomePage />
          </AuthRoute>
        }
      />
      <Route
        path={"/dashboard/templates"}
        element={
          <AuthRoute>
            <TemplatesPage />
          </AuthRoute>
        }
      />
      <Route
        path="/dashboard/templates/:templateId"
        element={
          <AuthRoute>
            <TemplateDetail />
          </AuthRoute>
        }
      />
      <Route
        path="/dashboard/templates/:templateId/edit"
        element={
          <AuthRoute>
            <TemplateEdit />
          </AuthRoute>
        }
      />
      <Route
        path={"/dashboard/projects"}
        element={
          <AdminRoute>
            <ProjectPage />
          </AdminRoute>
        }
      />
      <Route
        path="/dashboard/projects/:id"
        element={
          <AdminRoute>
            <ProjectDetail />
          </AdminRoute>
        }
      />
      <Route
        path="/dashboard/projects/:id/:scenarioId"
        element={
          <AdminRoute>
            <ScenarioDetail />
          </AdminRoute>
        }
      />
      <Route
        path={"/dashboard/users"}
        element={
          <AdminRoute>
            <UsersPage />
          </AdminRoute>
        }
      />
    </Routes>
  </BrowserRouter>
);
